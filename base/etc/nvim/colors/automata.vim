highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "tog"
" Editor highlighting
hi Normal            cterm=NONE ctermfg=0  ctermbg=15
hi Title             cterm=NONE ctermfg=NONE ctermbg=NONE

hi DiffDelete        cterm=NONE ctermfg=NONE ctermbg=1
hi DiffAdd           cterm=NONE ctermfg=NONE ctermbg=2
hi DiffText          cterm=NONE ctermfg=NONE ctermbg=3
hi DiffChange        cterm=NONE ctermfg=NONE ctermbg=4
hi SignColumn        cterm=NONE ctermfg=4   ctermbg=15

hi Cusor             cterm=NONE ctermfg=NONE  ctermbg=NONE
hi CursorLine        cterm=NONE ctermfg=NONE  ctermbg=8
hi CursorColumn      cterm=NONE ctermfg=NONE  ctermbg=8
hi ColorColumn       cterm=NONE ctermfg=NONE  ctermbg=8

hi TabLine           cterm=NONE ctermfg=0  ctermbg=8
hi TabLineSel        cterm=NONE ctermfg=0  ctermbg=15
hi TabLineFill       cterm=NONE ctermfg=NONE  ctermbg=NONE

hi Pmenu             cterm=NONE ctermfg=0  ctermbg=13
hi PmenuSel          cterm=NONE ctermfg=8  ctermbg=7
hi PmenuSbar         cterm=NONE ctermfg=7  ctermbg=8
hi PmenuThumb        cterm=NONE ctermfg=15   ctermbg=0

hi StatusLine        cterm=NONE ctermfg=15  ctermbg=8
hi StatusLineNC      cterm=NONE ctermfg=8 ctermbg=7

hi Folded            cterm=NONE ctermfg=7  ctermbg=15
hi FoldedColumn      cterm=NONE ctermfg=7  ctermbg=15

hi VertSplit         cterm=NONE ctermfg=7  ctermbg=NONE
hi Visual            cterm=NONE ctermfg=15   ctermbg=0
hi IncSearch         cterm=NONE ctermfg=15   ctermbg=0
hi Search            cterm=NONE ctermfg=15  ctermbg=11
hi LineNr            cterm=NONE ctermfg=7  ctermbg=NONE
hi CursorLineNr      cterm=NONE ctermfg=7  ctermbg=NONE

" Spell checking
hi SpellBad          cterm=NONE ctermfg=0  ctermbg=9
hi SpellCap          cterm=NONE ctermfg=0  ctermbg=4
hi SpellRare         cterm=NONE ctermfg=0  ctermbg=5
hi SpellLocal        cterm=NONE ctermfg=0  ctermbg=6

hi Question          cterm=NONE ctermfg=2  ctermbg=NONE
hi MoreMsg           cterm=NONE ctermfg=2  ctermbg=NONE
hi ModeMsg           cterm=bold ctermfg=8  ctermbg=NONE

hi SpecialKey        cterm=NONE ctermfg=14   ctermbg=NONE
hi Directory         cterm=NONE ctermfg=4   ctermbg=NONE
hi NonText           cterm=NONE ctermfg=14   ctermbg=NONE

hi ErrorMsg          cterm=NONE ctermfg=8   ctermbg=15
hi WarningMsg        cterm=NONE ctermfg=8   ctermbg=15

" Other
hi TODO              cterm=underline ctermfg=15  ctermbg=1
hi Error             cterm=NONE ctermfg=9  ctermbg=NONE
hi Underlined        cterm=underline ctermfg=0  ctermbg=NONE
hi LineNr            cterm=NONE ctermfg=0 ctermbg=NONE

" Syntax highlighting
hi Type              cterm=NONE ctermfg=0  ctermbg=NONE
hi Special           cterm=NONE ctermfg=0  ctermbg=NONE
hi Statement         cterm=NONE ctermfg=0  ctermbg=NONE
hi Identifier        cterm=NONE ctermfg=0  ctermbg=NONE
hi Function          cterm=NONE ctermfg=0  ctermbg=NONE
hi Constant          cterm=NONE ctermfg=0  ctermbg=NONE
hi MatchParen        cterm=underline ctermfg=0   ctermbg=NONE
hi Comment           cterm=NONE ctermfg=3  ctermbg=15
hi String            cterm=NONE ctermfg=5    ctermbg=NONE
hi Character         cterm=NONE ctermfg=5    ctermbg=NONE
hi PreProc           cterm=NONE ctermfg=0  ctermbg=NONE
hi Delimiter         cterm=NONE ctermfg=0  ctermbg=NONE
