# talb-dotfiles

My Linux shell and terminal configuration. `.config/` mirrors `~/.config`, and `install.sh`
applies all of it in one go.

```
install.sh                 back up, install missing apps, copy .config/ to ~/.config
themes/sunset-orange/     colours.toml - palette and role reference (not installed)
.config/
  bash/                    bashrc, profile, bash_logout (~/.bashrc etc. are 1-line stubs)
  dircolors/dircolors      LS_COLORS for ls and tree
  git/                     config + sunset-orange.gitconfig (colours)
  less/sunset-orange.sh    less + man page colours
  k9s/                     config.yaml, aliases.yaml, skins/sunset-orange.yaml
  yazi/                    theme.toml, flavors/sunset-orange.yazi/
  nvim/                    init.vim, colors/sunset-orange.vim
```

## Install

```sh
git clone <this repo> ~/repos/talb-dotfiles && cd ~/repos/talb-dotfiles
./install.sh               # or: ./install.sh --no-backup
```

`install.sh`:

1. Backs up the `~/.config/<app>` folders this repo ships (not the rest of `~/.config`, which can
   hold tokens), plus `~/.bashrc`, `~/.profile`, `~/.bash_logout` and `~/.gitconfig`, to
   `~/.dotfiles-backup/<timestamp>/`. Pass `--no-backup` to skip this.
2. Installs any of **tree**, **nvim**, **k9s** and **yazi** that are missing, which needs sudo.
   tree and neovim come from apt. k9s and yazi come from their latest GitHub release and go into
   `/usr/local/bin`.
3. Copies `.config/` over `~/.config`. Config for other apps is left alone.
4. Replaces `~/.bashrc`, `~/.profile` and `~/.bash_logout` with one-line stubs that source
   `~/.config/bash/*`. If `~/.gitconfig` is identical to `.config/git/config`, it's removed so git
   uses the XDG file.

It's safe to re-run. Open a new shell afterwards so `LS_COLORS` and the `LESS_TERMCAP_*`
variables load. tree has no config file of its own; it picks up its colours from `LS_COLORS`.

## Sunset Orange theme

A warm theme on a dark-grey background, with no greens or blues. Colours come from a
**gold → orange → red** gradient plus shades of grey. In k9s and yazi, the main text is the soft
orange `APRICOT`, menus and info values are light grey `GREY_200`, and gold marks highlights,
keys and the cursor bar.

| Role | Name | xterm | Hex |
|---|---|---|---|
| Background | `BG` | 236 | `#303030` |
| Status bars / darkest | `GREY_900` | 234 | `#1c1c1c` |
| Gutters / panels | `GREY_800` | 235 | `#262626` |
| Cursor line | `GREY_700` | 239 | `#4e4e4e` |
| Selection | `GREY_600` | 240 | `#585858` |
| Borders | `GREY_500` | 242 | `#6c6c6c` |
| Comments / muted | `GREY_400` | 244 | `#808080` |
| Secondary text | `GREY_200` | 250 | `#bcbcbc` |
| Foreground | `FG` | 223 | `#ffd7af` |
| Gradient 1 (success / added) | `GOLD` | 220 | `#ffd700` |
| Gradient 2 (warning) | `AMBER` | 214 | `#ffaf00` |
| **Gradient 3 (primary)** | **`ORANGE`** | **208** | **`#ff8700`** |
| Gradient 4 (modified) | `EMBER` | 202 | `#ff5f00` |
| Gradient 5 (error / removed) | `RED` | 196 | `#ff0000` |
| Dark shades | `BURNT` / `RUST` / `CRIMSON` | 166 / 130 / 160 | `#d75f00` / `#af5f00` / `#d70000` |
| Light shades | `LIGHT_GOLD` / `APRICOT` / `CORAL` / `LIGHT_RED` | 221 / 215 / 209 / 203 | `#ffd75f` / `#ffaf5f` / `#ff875f` / `#ff5f5f` |

Every colour is an exact xterm-256 value, so truecolor apps, nvim without `termguicolors`, and
k9s (which downsamples to 256 colours) all render the same.

### Changing colours

The palette is recorded in `themes/sunset-orange/colours.toml` (hex, xterm index, roles and
the files that use each colour). Nothing reads it automatically. Edit the files under `.config/`
directly, then re-run `./install.sh --no-backup`. The colours
appear as hex (`#ff8700`) in k9s, yazi and nvim, and as xterm-256 indexes (`38;5;208`) in
dircolors, git and less. Use the palette table above to keep them consistent.

| App | Theme file | Activated by |
|---|---|---|
| ls / tree | `dircolors/dircolors` | `bash/bashrc` (`dircolors -b`) |
| git | `git/sunset-orange.gitconfig` | `[include]` in `git/config` |
| less / man | `less/sunset-orange.sh` | sourced from `bash/bashrc` |
| k9s | `k9s/skins/sunset-orange.yaml` | `k9s.ui.skin` in `k9s/config.yaml` |
| yazi | `yazi/flavors/sunset-orange.yazi/` | `[flavor]` in `yazi/theme.toml` |
| nvim | `nvim/colors/sunset-orange.vim` | `colorscheme` in `nvim/init.vim` |

## Not included (on purpose)

- Secrets and credentials: `~/.ssh`, `~/.gnupg`, `~/.kube`, `~/.azure`, `~/.git-credentials`,
  `~/.config/gh/hosts.yml`, `~/.config/pam/env`, the argocd and helm registry configs, and salt/password files.
- Shell, psql and python histories, plus k9s cluster state (`~/.local/share/k9s`).

`bash/bashrc` sources `~/.config/pam/env` only if that file exists. Recreate it by hand on a new machine.

## Updating the repo from a machine

```sh
cp -a ~/.config/{bash,dircolors,git,less,k9s,yazi,nvim} .config/
git status && git diff
```
