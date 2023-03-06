source $VIMRUNTIME/defaults.vim

set nocompatible
" VUDLE PLUGIN MANAGER:
filetype off
set shellslash
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
Plugin 'vim-scripts/vim-auto-save'
Plugin 'junegunn/vim-easy-align'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let g:auto_save=1
let g:auto_save_events=["InsertLeave"]

" EOL
set fileformat=unix

xmap ga <Plug>(EasyAlign)

" GUI:
set lines=40 columns=170
colorscheme strawberrymint
set guifont=Consolas:h11
" hide some gui features
" The menu 'm' needs to be removed for alt+h work
set guioptions-=m
set guioptions-=e
set guioptions-=T

" EDITING:
set ruler
set tabstop=4 shiftwidth=4 expandtab autoindent
set mouse=nv
set colorcolumn=80,100,120
set cursorline
set nowrap
set autowrite
set autowriteall
set autoread

" SEARCH:
set nohlsearch
set ignorecase
set smartcase
map <F2> :%s//gc<Left><Left><Left>

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
" NOW WE CAN:
" -Hit tab to :tabfind and :find by partial match
" - Use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" TAG JUMPING:
map <F7> :Make tags /nologo<CR>
" Create the 'tags' file (need ctags)
" command! MakeTags !ctags -R
" Extra tags for msvc STL and Win32 Header Files
" E:/Dev/ctags/win32_tags/tags    tags for windows kit
set tags=./tags,tags,/ " E:/Dev/ctags/msvc_tags/tags,E:/Dev/ctags/win32_tags/tags
" NOW WE CAN:
" -Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETION:
set infercase
" HIGHLIGHTS:
" TODO: Change search pattern to fix slowdown
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" QUICKFIX:
" this is needed before remap <Enter> key to not break the quickfix window
" <Enter> default behavior
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" do not list quickfix in buffers
" This is in case of git, msvc or some other external program modification

" GREP:
" This is configured to use windows findstr command
"
command! -nargs=* Findstr lgrep! <args> | botright lwindow 10
map <F4> :Findstr /s /i  src/*<Left><Left><Left><Left><Left><Left>


"augroup quickfix
"    autocmd!
"    autocmd QuickFixCmdPost [^l]* cwindow
"    autocmd QuickFixCmdPost l* lwindow
"augroup END

" SPLITS:
set equalalways
set splitright
set splitbelow
" SPLIT MAPS:
" shift+ctrl+=
" for some reason the verbose :vertical-split ignores equalalways option
nmap ซ :vsp<CR>
" shift+ctrl+-
nmap ฿ :split<CR>
" SPLIT NAVIGATION:
nmap ่ <C-w><Left>
nmap ๊ <C-w><Down>
nmap ๋ <C-w><Up>
nmap ์ <C-w><Right>

" AUTOCLOSE:
" NOTE: This break repeat feature
" NOTE: this <Left><Left> could be replaced to append ; to the line
" delimitMate is used to delete the autoclose
let delimitMate_autoclose=0
" let delimitMate_expand_cr=1
inoremap " ""<Left>
inoremap "; "";<Left><Left>
" inoremap ' ''<Left>
" inoremap '; '';<Left><Left>
inoremap ( ()<Left>
inoremap (; ();<Left><Left>
inoremap (: ():<Left><Left>
inoremap [ []<Left>
inoremap [; [];<Left><Left>
inoremap { {}<Left>
" inoremap {<CR> {<CR>}<ESC>O
inoremap {; {};<Left><Left>
" inoremap {;<CR> {<CR>};<ESC>O

" NETRW:
" Toggle netrw
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Explore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <F3> :call ToggleNetrw()<CR>

" SESSIONS AND STARTUP SCREEN:
set sessionoptions-=options
set sessionoptions+=localoptions
set sessionoptions+=curdir
set sessionoptions+=winpos
set sessionoptions+=resize
set sessionoptions+=winpos
set sessionoptions-=blank
set sessionoptions-=globals

" only save session if open ./ folder.
" TODO: create a better plugin for this
if argc() == 1 && argv(0) == './'
    autocmd VimLeavePre * mksession! .session.vim

    if filereadable(".session.vim")
        " maybe split or not
        " autocmd VimEnter * lefta vsplit
        autocmd VimEnter * source .session.vim
    endif
endif

" SPELLCHECK:
set spelllang=pt,en

set showcmd

" No blinking cursor on normal, visual and command mode
set guicursor+=n-v-c:blinkon0

" set clipboard     this is not necessery in gvim
set number 
" this is needed for cli vim
nnoremap <C-\> <C-]>

" ctrl-backspace to delete a word in insert mode like other editors
imap <C-BS> <C-w>
cmap <C-BS> <C-w>
noremap! <C-h> <C-w>

" Add new line in normal mode
" after current line
nmap <Enter> o<ESC>
" before current line
nmap <S-Enter> O<ESC>

noremap <C-Enter> <C-]>

" Add new line in insert mode
" before current line
imap <C-Enter> <ESC>O

" Ctrl-c to prefix vim command to copy into system clipboard in normal mode
nmap <C-c> "*
" Ctrl-c to copy selection into system clipboard in visual mode
vmap <C-c> "*y
" Ctrl-x to cut selection into system clipboard in visual mode
" vmap <C-x> "*d      this is default in gvim
" Ctrl-v to paste system clipboard into vim in normal mode
nmap <C-v> "+p
" Ctrl-v to paste system clipboard into vim in command mode
cmap <C-v> <C-r>+p
" Ctrl-v to paste system clipboard into vim in insert mode
imap <C-v> <ESC>"+pa

" change word with the yank register
" noremap <C-p> ciw<C-r>0<ESC>
"
" past from the yank register
map รฐ "0p

" Tab in vim is shitty so we will use buffers
" Skip Quickfix buffer
function! BSkipQuickFix(command)
  let start_buffer = bufnr('%')
  execute a:command
  while &buftype ==# 'quickfix' && bufnr('%') != start_buffer
    execute a:command
  endwhile
endfunction

nmap <C-Tab> :call BSkipQuickFix("bnext")<CR>
nmap <C-S-Tab> :call BSkipQuickFix("bprevious")<CR>
nnoremap รท :bdelete<CR>

" Indent and deindent line in normal mode, not perfect because shift the
" cursor
nmap <Tab> >>
nmap <S-Tab> <<
imap <S-Tab> <C-d>

nmap <C-j> <C-e>
nmap <C-k> <C-y>

" THEME TWEAK:
highlight CursorLineNr guifg=lightgrey ctermfg=lightgrey

" SNNIPETS:
noremap ,html  :-1read E:\\dev\\snippets\\html_snippets\\html_boilerplate.html<CR>4jwf>l
noremap ,cmake :-1read E:\\dev\\snippets\\cmake_snippets\\CmakeLists.txt<CR>2jw
noremap ,main  :-1read E:\\dev\\snippets\\cpp_snippets\\main.c<CR>5j$
noremap ,win32 :-1read E:\\dev\\snippets\\cpp_snippets\\win32main.c<CR>4j$

