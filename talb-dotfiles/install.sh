#!/usr/bin/env bash
# Install talb-dotfiles: back up the config it replaces, install any missing apps (k9s, yazi, nvim, tree)
# and copy this repo's .config/ over ~/.config.
set -euo pipefail

usage() {
    cat <<'EOF'
Usage: ./install.sh [--no-backup] [-h|--help]

  --no-backup   Don't back up the files this script replaces.
  -h, --help    Show this help.

Steps:
  1. Back up the ~/.config/<app> folders this repo ships, plus ~/.bashrc,
     ~/.profile, ~/.bash_logout and ~/.gitconfig, to ~/.dotfiles-backup/<timestamp>/
  2. Install any missing apps: tree and neovim (apt), k9s and yazi (latest GitHub release)
  3. Copy the repo's .config/ over ~/.config (other apps' config is left alone)
  4. Point ~/.bashrc, ~/.profile and ~/.bash_logout at ~/.config/bash/
EOF
}

BACKUP=1
for arg in "$@"; do
    case "$arg" in
        --no-backup) BACKUP=0 ;;
        -h|--help) usage; exit 0 ;;
        *) echo "Unknown option: $arg" >&2; usage >&2; exit 2 ;;
    esac
done

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
HOME_FILES=(.bashrc .profile .bash_logout .gitconfig)

log()  { printf '\033[38;5;208m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[38;5;196mwarning:\033[0m %s\n' "$*" >&2; }

SUDO=""
if [[ $EUID -ne 0 ]]; then SUDO="sudo"; fi

# --------------------------------------------------------------------------
# 1. Backup
# --------------------------------------------------------------------------
if (( BACKUP )); then
    dest="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
    log "Backing up to $dest"
    mkdir -p "$dest"
    # Only the app folders this repo overwrites; the rest of ~/.config can hold tokens.
    mkdir -p "$dest/.config"
    for d in "$REPO"/.config/*/; do
        app="$(basename "$d")"
        if [[ -e "$CONFIG/$app" ]]; then cp -a "$CONFIG/$app" "$dest/.config/"; fi
    done
    for f in "${HOME_FILES[@]}"; do
        if [[ -e "$HOME/$f" ]]; then cp -a "$HOME/$f" "$dest/"; fi
    done
else
    log "Skipping backup (--no-backup)"
fi

# --------------------------------------------------------------------------
# 2. Applications
# --------------------------------------------------------------------------
have() { command -v "$1" >/dev/null 2>&1; }

APT_UPDATED=0
apt_install() {
    if ! have apt-get; then
        warn "apt-get not found - install manually: $*"
        return 1
    fi
    if (( ! APT_UPDATED )); then
        $SUDO apt-get update -qq || return 1
        APT_UPDATED=1
    fi
    $SUDO apt-get install -y -qq "$@"
}

case "$(uname -m)" in
    x86_64|amd64)  K9S_ARCH=amd64; YAZI_ARCH=x86_64 ;;
    aarch64|arm64) K9S_ARCH=arm64; YAZI_ARCH=aarch64 ;;
    *)             K9S_ARCH=""; YAZI_ARCH="" ;;
esac

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

need_tools() {
    local missing=()
    for t in "$@"; do have "$t" || missing+=("$t"); done
    if (( ${#missing[@]} )); then apt_install "${missing[@]}"; fi
}

install_k9s() {
    [[ -n "$K9S_ARCH" ]] || { warn "unsupported architecture for k9s: $(uname -m)"; return 1; }
    need_tools curl tar &&
        curl -fsSL -o "$TMP/k9s.tar.gz" \
            "https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_${K9S_ARCH}.tar.gz" &&
        tar -xzf "$TMP/k9s.tar.gz" -C "$TMP" k9s &&
        $SUDO install -m 0755 "$TMP/k9s" /usr/local/bin/k9s
}

install_yazi() {
    [[ -n "$YAZI_ARCH" ]] || { warn "unsupported architecture for yazi: $(uname -m)"; return 1; }
    local name="yazi-${YAZI_ARCH}-unknown-linux-gnu"
    need_tools curl unzip &&
        curl -fsSL -o "$TMP/yazi.zip" "https://github.com/sxyazi/yazi/releases/latest/download/${name}.zip" &&
        unzip -q "$TMP/yazi.zip" -d "$TMP" &&
        $SUDO install -m 0755 "$TMP/$name/yazi" "$TMP/$name/ya" /usr/local/bin/
}

log "Checking applications"
for app in tree nvim k9s yazi; do
    if have "$app"; then
        echo "    $app: already installed ($(command -v "$app"))"
        continue
    fi
    echo "    $app: installing"
    case "$app" in
        tree) apt_install tree ;;
        nvim) apt_install neovim ;;
        k9s)  install_k9s ;;
        yazi) install_yazi ;;
    esac || warn "failed to install $app - continuing with config only"
done

# --------------------------------------------------------------------------
# 3. Config
# --------------------------------------------------------------------------
log "Copying config to $CONFIG"
mkdir -p "$CONFIG"
cp -a "$REPO/.config/." "$CONFIG/"
(cd "$REPO/.config" && find . -mindepth 1 -maxdepth 1 -printf '    %P\n' | sort)

# --------------------------------------------------------------------------
# 4. Home dotfiles: one-line stubs that load ~/.config/bash/*
# --------------------------------------------------------------------------
log "Linking shell startup files to ~/.config/bash"
for f in bashrc profile bash_logout; do
    stub="# Managed by talb-dotfiles - edit ~/.config/bash/$f instead.
[ -r \"\${XDG_CONFIG_HOME:-\$HOME/.config}/bash/$f\" ] && . \"\${XDG_CONFIG_HOME:-\$HOME/.config}/bash/$f\""
    if [[ -f "$HOME/.$f" && "$(cat "$HOME/.$f")" == "$stub" ]]; then
        echo "    ~/.$f: already set"
    else
        printf '%s\n' "$stub" > "$HOME/.$f"
        echo "    ~/.$f: updated"
    fi
done

# git reads ~/.config/git/config, but ~/.gitconfig wins if it exists.
if [[ -f "$HOME/.gitconfig" ]]; then
    if cmp -s "$HOME/.gitconfig" "$REPO/.config/git/config"; then
        rm "$HOME/.gitconfig"
        echo "    ~/.gitconfig: removed (same as ~/.config/git/config)"
    else
        warn "$HOME/.gitconfig exists and overrides $CONFIG/git/config - merge it by hand and delete it"
    fi
fi

log "Done. Open a new shell to load the colours."
