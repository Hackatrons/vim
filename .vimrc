"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" import windows compatibility settings
source $VIMRUNTIME/mswin.vim

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

" enable spell checking
set spell spelllang=en_au

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colour Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme solarized

if has("gui_running")
	if &diff
		" I prefer a light background for diffs
    	set background=light
	else
		set background=dark
	endif
endif

" to fix an issue with highlighting in ConEmu
" https://stackoverflow.com/questions/14315519/conemu-vim-syntax-highlight
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Styling/Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlighting
syntax on
syntax enable

if has("gui_running")
	set guifont=Consolas:h11:cANSI
	au GUIEnter * simalt ~x " maximize the window
endif

" tab width = 4 spaces
set tabstop=4
set shiftwidth=4

" set code folding on indentation
set foldmethod=indent
" expand all folds by default (up to 999 depth) 
set foldlevelstart=999

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

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

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
