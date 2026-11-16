" Sunset Orange - neovim colourscheme.
" Works with and without 'termguicolors' (cterm values are exact xterm-256).

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'sunset-orange'

" Editor UI
hi Normal guifg=#ffd7af ctermfg=223 guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi NormalFloat guifg=#ffd7af ctermfg=223 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi FloatBorder guifg=#6c6c6c ctermfg=242 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi Cursor guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=NONE cterm=NONE
hi lCursor guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=NONE cterm=NONE
hi CursorIM guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=NONE cterm=NONE
hi TermCursor guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#4e4e4e ctermbg=239 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#4e4e4e ctermbg=239 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi CursorLineNr guifg=#ff8700 ctermfg=208 guibg=#4e4e4e ctermbg=239 gui=bold cterm=bold
hi LineNr guifg=#6c6c6c ctermfg=242 guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi SignColumn guifg=#6c6c6c ctermfg=242 guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi FoldColumn guifg=#6c6c6c ctermfg=242 guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi Folded guifg=#808080 ctermfg=244 guibg=#262626 ctermbg=235 gui=italic cterm=italic
hi VertSplit guifg=#6c6c6c ctermfg=242 guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi WinSeparator guifg=#6c6c6c ctermfg=242 guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi StatusLine guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=bold cterm=bold
hi StatusLineNC guifg=#bcbcbc ctermfg=250 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi StatusLineTerm guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=bold cterm=bold
hi StatusLineTermNC guifg=#bcbcbc ctermfg=250 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi TabLine guifg=#bcbcbc ctermfg=250 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi TabLineSel guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=bold cterm=bold
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#1c1c1c ctermbg=234 gui=NONE cterm=NONE
hi WinBar guifg=#ffd7af ctermfg=223 guibg=#303030 ctermbg=236 gui=bold cterm=bold
hi WinBarNC guifg=#808080 ctermfg=244 guibg=#303030 ctermbg=236 gui=NONE cterm=NONE
hi Visual guifg=NONE ctermfg=NONE guibg=#585858 ctermbg=240 gui=NONE cterm=NONE
hi VisualNOS guifg=NONE ctermfg=NONE guibg=#585858 ctermbg=240 gui=NONE cterm=NONE
hi Search guifg=#1c1c1c ctermfg=234 guibg=#ffd700 ctermbg=220 gui=NONE cterm=NONE
hi CurSearch guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=bold cterm=bold
hi IncSearch guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=bold cterm=bold
hi Substitute guifg=#1c1c1c ctermfg=234 guibg=#ff5f00 ctermbg=202 gui=NONE cterm=NONE
hi MatchParen guifg=#ff8700 ctermfg=208 guibg=#585858 ctermbg=240 gui=bold cterm=bold
hi Pmenu guifg=#ffd7af ctermfg=223 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi PmenuSel guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=bold cterm=bold
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#4e4e4e ctermbg=239 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#ff8700 ctermbg=208 gui=NONE cterm=NONE
hi WildMenu guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=bold cterm=bold
hi NonText guifg=#6c6c6c ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#6c6c6c ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#6c6c6c ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Whitespace guifg=#6c6c6c ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#808080 ctermfg=244 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Directory guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Title guifg=#ffaf00 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi ErrorMsg guifg=#ff0000 ctermfg=196 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi WarningMsg guifg=#ffaf00 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi MoreMsg guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi ModeMsg guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Question guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=NONE ctermfg=NONE guibg=#4e4e4e ctermbg=239 gui=bold cterm=bold
hi ToolbarLine guifg=#ffd7af ctermfg=223 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi ToolbarButton guifg=#1c1c1c ctermfg=234 guibg=#ff8700 ctermbg=208 gui=bold cterm=bold

" Diff
hi DiffAdd guifg=#ffd700 ctermfg=220 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi DiffDelete guifg=#ff0000 ctermfg=196 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#4e4e4e ctermbg=239 gui=NONE cterm=NONE
hi DiffText guifg=#1c1c1c ctermfg=234 guibg=#ffaf00 ctermbg=214 gui=bold cterm=bold
hi Added guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Removed guifg=#ff0000 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Changed guifg=#ff5f00 ctermfg=202 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffAdded guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffRemoved guifg=#ff0000 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffChanged guifg=#ff5f00 ctermfg=202 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffFile guifg=#ffaf00 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi diffLine guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi diffSubname guifg=#ffd7af ctermfg=223 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" Spelling
hi SpellBad guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=underline guisp=#ff0000
hi SpellCap guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=underline guisp=#ffaf00
hi SpellRare guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=underline guisp=#ff875f
hi SpellLocal guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=underline guisp=#ffd700

" Syntax: keywords orange, types and strings gold, numbers coral, preproc ember
hi Comment guifg=#808080 ctermfg=244 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Constant guifg=#ff875f ctermfg=209 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#ffd75f ctermfg=221 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#ff875f ctermfg=209 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#ff875f ctermfg=209 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Float guifg=#ff875f ctermfg=209 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#ffd7af ctermfg=223 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#ffaf00 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Conditional guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Repeat guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Label guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Operator guifg=#ffaf5f ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Exception guifg=#ff0000 ctermfg=196 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi PreProc guifg=#ff5f00 ctermfg=202 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Include guifg=#ff5f00 ctermfg=202 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Define guifg=#ff5f00 ctermfg=202 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Macro guifg=#ff5f00 ctermfg=202 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#ff5f00 ctermfg=202 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#d75f00 ctermfg=166 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#ffd75f ctermfg=221 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Tag guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Delimiter guifg=#bcbcbc ctermfg=250 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#808080 ctermfg=244 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Debug guifg=#ff5f5f ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#ffaf5f ctermfg=215 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi Ignore guifg=#6c6c6c ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Error guifg=#eeeeee ctermfg=255 guibg=#d70000 ctermbg=160 gui=bold cterm=bold
hi Todo guifg=#1c1c1c ctermfg=234 guibg=#ffaf00 ctermbg=214 gui=bold cterm=bold

" Neovim diagnostics and LSP
hi DiagnosticError guifg=#ff0000 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiagnosticWarn guifg=#ffaf00 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiagnosticInfo guifg=#ff8700 ctermfg=208 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiagnosticHint guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiagnosticOk guifg=#ffd700 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiagnosticUnderlineError guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=underline guisp=#ff0000
hi DiagnosticUnderlineWarn guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=underline guisp=#ffaf00
hi DiagnosticUnderlineInfo guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=underline guisp=#ff8700
hi DiagnosticUnderlineHint guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=underline guisp=#ffd700
hi DiagnosticUnderlineOk guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=underline guisp=#ffd700
hi LspReferenceText guifg=NONE ctermfg=NONE guibg=#4e4e4e ctermbg=239 gui=NONE cterm=NONE
hi LspReferenceRead guifg=NONE ctermfg=NONE guibg=#4e4e4e ctermbg=239 gui=NONE cterm=NONE
hi LspReferenceWrite guifg=NONE ctermfg=NONE guibg=#4e4e4e ctermbg=239 gui=bold cterm=bold

" Common plugins (gitsigns, signify, gitgutter)
hi! link GitSignsAdd Added
hi! link GitSignsChange Changed
hi! link GitSignsDelete Removed
hi! link SignifySignAdd Added
hi! link SignifySignChange Changed
hi! link SignifySignDelete Removed
hi! link GitGutterAdd Added
hi! link GitGutterChange Changed
hi! link GitGutterDelete Removed

" Embedded terminal colours (warm ANSI-16 mapping)
if has("nvim")
  let g:terminal_color_0 = '#1c1c1c'
  let g:terminal_color_1 = '#d70000'
  let g:terminal_color_2 = '#ffaf00'
  let g:terminal_color_3 = '#ffd700'
  let g:terminal_color_4 = '#ff8700'
  let g:terminal_color_5 = '#ff5f00'
  let g:terminal_color_6 = '#d75f00'
  let g:terminal_color_7 = '#bcbcbc'
  let g:terminal_color_8 = '#808080'
  let g:terminal_color_9 = '#ff5f5f'
  let g:terminal_color_10 = '#ffd75f'
  let g:terminal_color_11 = '#ffd700'
  let g:terminal_color_12 = '#ffaf5f'
  let g:terminal_color_13 = '#ff875f'
  let g:terminal_color_14 = '#ffd7af'
  let g:terminal_color_15 = '#eeeeee'
else
  let g:terminal_ansi_colors = ['#1c1c1c', '#d70000', '#ffaf00', '#ffd700', '#ff8700', '#ff5f00', '#d75f00', '#bcbcbc', '#808080', '#ff5f5f', '#ffd75f', '#ffd700', '#ffaf5f', '#ff875f', '#ffd7af', '#eeeeee']
endif
