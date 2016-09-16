" import windows compatibility settings
source $VIMRUNTIME/mswin.vim

" pathogen
execute pathogen#infect()

" code syntax colouring
syntax on
syntax enable

" tab width = 4 spaces
set tabstop=4
set shiftwidth=4

" tab/shift tab for indentation
" for command mode
nnoremap <S-Tab> <<
nnoremap <Tab> >> 
" for insert mode
inoremap <S-Tab> <C-d>

" auto file type detection for indenting without relying on the file extension
filetype plugin indent on

" case insensitive searching
set smartcase
set ignorecase

" incremental search while typing
set incsearch

" line numbers
set number

" colour scheme
set background=dark
colorscheme solarized
" to fix an issue with highlighting
" https://stackoverflow.com/questions/14315519/conemu-vim-syntax-highlight
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" highlight matching braces, brackets, etc
set showmatch

" remap jj to escape in insert mode
inoremap jj <Esc>

" paste mode
set pastetoggle=<F2>

" enable row/col ruler
set ruler

" allow backspace to delete these characters
set backspace=indent,eol,start

" full menu for command tab completion
set wildmenu
set wildmode=list:longest,full

" EasyMotion: one leader key instead of two
let g:EasyMotion_leader_key = '<Leader>'

" backspace fix for ConEmu
" https://github.com/Maximus5/ConEmu/issues/641
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
