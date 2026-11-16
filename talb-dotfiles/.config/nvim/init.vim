" Minimal neovim config.
syntax on
filetype plugin indent on

" Use 24-bit colour when the terminal supports it. The sunset-orange cterm values
" are exact xterm-256 matches, so it looks the same either way.
if $COLORTERM ==# 'truecolor' || $COLORTERM ==# '24bit'
  set termguicolors
endif
silent! colorscheme sunset-orange

augroup trim_trailing_blank_lines
  autocmd!
  autocmd BufWritePre *.rb,*.erb,*.json,*.yml,*.yaml silent! %s/\n\+\%$//e
augroup END
