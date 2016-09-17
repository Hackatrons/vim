"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" import windows compatibility settings
source $VIMRUNTIME/mswin.vim

" pathogen
execute pathogen#infect()

" case insensitive searching
set smartcase
set ignorecase

" incremental search while typing
set incsearch

" enable line numbers
set number

" highlight matching braces, brackets, etc
set showmatch

" enable row/col ruler
set ruler

" allow backspace to delete these characters
set backspace=indent,eol,start

" full menu for command tab completion
set wildmenu
set wildmode=list:longest,full

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colour Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized
" to fix an issue with highlighting in ConEmu
" https://stackoverflow.com/questions/14315519/conemu-vim-syntax-highlight
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Styling/Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlighting
syntax on
syntax enable

" tab width = 4 spaces
set tabstop=4
set shiftwidth=4

" auto file type detection for indentation without relying on the file extension
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" one leader key instead of two
let g:EasyMotion_leader_key = '<Leader>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map ; to : for quicker command execution e.g. ;e is faster to type than :e
nnoremap ; :

" set leader key
let mapleader = ","

" tab/shift tab for indentation
" for command mode
nnoremap <S-Tab> <<
nnoremap <Tab> >> 
" for insert mode
inoremap <S-Tab> <C-d>

" remap jj to escape in insert mode
inoremap jj <Esc>

" paste mode
set pastetoggle=<F2>

" backspace fix for ConEmu
" https://github.com/Maximus5/ConEmu/issues/641
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open nerd tree if no files were specified when starting vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" toggle key
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Matchit http://www.vim.org/scripts/script.php?script_id=39
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:source ~/.vim/plugin/matchit.vim
:helptags ~/.vim/doc
