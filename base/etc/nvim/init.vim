" 
" Author: Todd Gaunt 
" Vim configuration settings

" => Plugin Manager
execute pathogen#infect()

filetype plugin indent on
syntax enable

" => General
set nocompatible
filetype off
set history=1500
set undolevels=1000
set number
set autoread
let mapleader = "\<Space>"
set showcmd
set modeline
set modelines=1

" => User interface
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc
set ruler
set cmdheight=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set tm=500

" => Autocomplete / Ctags
nnoremap <leader>] <C-]>
nnoremap <leader>[ <C-t>

" => Colors and Fonts
syntax on
if exists('+colorcolumn')
    set colorcolumn=80
    set t_ut=
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
nnoremap <leader>ll :set cursorline! cursorcolumn!<CR>
set t_Co=256
set background=light
colorscheme automata
set encoding=utf-8
set ffs=unix,dos,mac

" => Files, backups and undo
set nobackup
set nowb
set noswapfile
set noundofile

" => Text, tab and indent related
" Defaults
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
" Per filetype indentation settings
autocmd filetype c setlocal expandtab smarttab ts=4 sw=4 sts=4
autocmd filetype go setlocal expandtab smarttab ts=2 sw=2 sts=2
autocmd filetype haskell setlocal expandtab smarttab ts=4 sw=4 sts=4
autocmd filetype java setlocal noexpandtab nosmarttab ts=4 sw=4 sts=4
autocmd filetype json setlocal noexpandtab nosmarttab ts=4 sw=4 sts=4
autocmd filetype lisp setlocal expandtab smarttab ts=2 sw=2 sts=2
autocmd filetype python setlocal expandtab smarttab ts=4 sw=4 sts=4
autocmd filetype rust setlocal expandtab smarttab ts=4 sw=4 sts=4
autocmd filetype scheme setlocal expandtab smarttab ts=2 sw=2 sts=2
autocmd filetype tex setlocal expandtab smarttab ts=2 sw=2 sts=2
set autoindent
set smartindent 
set nowrap

" Highlight tab characters
"set list
"set listchars=tab:••

" => Visual mode related
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
" Swap block and normal visual modes
nnoremap    v    <C-V>
nnoremap  <C-V>    v

" => Moving around, tabs, windows and buffers
" Recursively search for tags file
set tags=./tags;,tags;
" Ctags navigation
map <leader>cf :tfirst<cr>
map <leader>cl :tlast<cr>
map <leader>cn :tnext<cr>
map <leader>cp :tprev<cr>
map <leader>cs :tselect<cr>
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
" Move twice as fast
map <S-j> 4j
map <S-k> 4k
map <S-h> 4h
map <S-l> 4l
" Disable search highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
tnoremap <C-j> <C-\><C-N><C-W>j
tnoremap <C-k> <C-\><C-N><C-W>k
tnoremap <C-h> <C-\><C-N><C-W>h
tnoremap <C-l> <C-\><C-N><C-W>l
tnoremap <ESC><ESC> <C-\><C-N>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Global search and replace
nmap  S  :%s//g<LEFT><LEFT>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry
" Return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Remember info about open buffers on close
set viminfo^=%

" => Status line
set laststatus=2
" Format the status line
if has("statusline")
    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:%r%{getcwd()}%h\ \ \ Line:\ %l\ Column:\ %c
    set statusline+=\ \ \ [%{strlen(&fenc)?&fenc:'none'}]
endif

" => Spell checking
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>sz z=

" => Misc
" Show highlighting groups for current word, unbinds normal S-k help sg
" nmap <S-k> :call <SID>SynStack()<CR>
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Quickly open a buffer as a scratchpad
map <leader>- :e ~/tmp/scratch<cr>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" Enable folding
noremap <Bslash> za
set foldmethod=indent
set foldlevel=100
set foldlevelstart=100
" Disable EX mode
nnoremap Q <nop>
" Format text to wrap at 80 lines without breaking words
" :set formatoptions+=w
" :set tw=80
:nnoremap Q gggqG

" => Helper functions
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
" Used for text encoding
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col ('.')), 'synIDattr(v:val, "name")')
endfunc
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
 
" => Plugins
" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" Neomake
call neomake#configure#automake('w')
let g:neomake_c_enabled_makers = ['clang']
let g:neomake_c_clang_maker = {
   \ 'exe': 'clang',
   \ 'args': ['-Wall', '-Iinclude', '-Wextra', '-pedantic', '-Wno-sign-conversion'],
   \ }
" Deoplete
let g:deoplete#enable_at_startup = 1
" Vimwiki
let g:vimwiki_list = [{
                    \     'path': '~/usr/wiki/knowledge',
                    \     'path_html': '~/usr/wiki/knowledge',
                    \     'template_path': '~/usr/wiki/templates',
                    \     'template_default': 'knowledge',
                    \     'template_ext': '.html'
                    \ },
                    \ {
                    \     'path': '~/usr/wiki/lunargarden',
                    \     'path_html': '~/usr/wiki/lunargarden',
                    \     'template_path': '~/usr/wiki/templates',
                    \     'template_default': 'lunargarden',
                    \     'template_ext': '.html'
                    \ }]
:nmap <leader>we <plug>VimwikiSplitLink
:nmap <leader>wq <plug>VimwikiVSplitLink

" end of file
