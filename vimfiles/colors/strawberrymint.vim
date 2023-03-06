" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2016 Sep 04

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "straberrymint"
" Dark Bluesh
hi Normal		  guibg=#152429 guifg=#dfebf7 
hi Scrollbar	  guifg=darkcyan guibg=cyan
hi Menu			  guifg=black guibg=cyan
hi SpecialKey	  term=bold  cterm=bold  ctermfg=darkred  guifg=#cc0000
hi NonText		  term=bold  cterm=bold  ctermfg=darkred  gui=bold      guifg=#cc0000
hi Directory	  term=bold  cterm=bold  ctermfg=brown  guifg=#cc8000
hi ErrorMsg		  term=standout  cterm=bold  ctermfg=grey  ctermbg=red  guifg=White  guibg=Red
hi Search		  term=reverse  ctermfg=white  ctermbg=red      guifg=white  guibg=Red
hi MoreMsg		  term=bold  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=SeaGreen
hi ModeMsg		  term=bold  cterm=bold  gui=bold  guifg=White	guibg=Blue
" Whitesh grey
hi LineNr		  term=underline  cterm=bold  ctermfg=darkcyan	guifg=#dfebf7

hi Question		  term=standout  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=Green
hi StatusLine	  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi StatusLineNC   term=reverse	ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Visual		  term=reverse	cterm=reverse  guifg=#152429 guibg=lightgrey 
hi WarningMsg	  term=standout  cterm=bold  ctermfg=darkred guifg=Red
hi Cursor		  guifg=#152429	guibg=#dfebf7 
" Green
hi Comment		  term=bold  cterm=bold ctermfg=green guifg=#57a64a

hi Special		  term=bold  cterm=bold ctermfg=red  guifg=Orange
hi Identifier	  term=underline   ctermfg=brown  guifg=#40ffff
" Light Margenta
hi Statement	  term=bold  cterm=bold ctermfg=yellow	gui=bold  guifg=#cc99cc
hi Type			  term=underline  cterm=bold ctermfg=lightgreen  gui=bold  guifg=#cc99cc
" Purple
hi PreProc		  term=underline  ctermfg=darkmagenta   guifg=#beb7ff
" Mint/light green
hi Constant		  term=underline  cterm=bold ctermfg=magenta  guifg=#b5cea8
hi Title		  term=bold  cterm=bold  ctermfg=darkmagenta  gui=bold	guifg=#b5cea8

hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black  guifg=Red	guibg=Black
" Yellow
hi Todo			  term=standout  ctermfg=black	ctermbg=darkcyan  guifg=Yellow guibg=NONE
" Darkgrey
hi CursorLine	  term=underline  guibg=#2d3b40 term=underline
hi CursorColumn	  term=underline  guibg=#2d3b40 cterm=underline
hi ColorColumn	  term=underline  guibg=#2d3b40 cterm=underline

" cor de pele
hi StringColor guifg=#d59d85

hi MatchParen	  term=reverse  ctermfg=blue guibg=Blue

" TODO: change tab colors
hi TabLine		  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineFill	  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=blue guibg=white
hi TabLineSel	  term=reverse	ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Underlined	  term=underline cterm=bold,underline ctermfg=lightblue guifg=lightblue gui=bold,underline
hi Ignore		  ctermfg=black ctermbg=black guifg=black guibg=black
hi EndOfBuffer	  term=bold  cterm=bold  ctermfg=darkred guifg=#cc0000 gui=bold

hi link IncSearch		Visual
hi link String			StringColor

hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special
