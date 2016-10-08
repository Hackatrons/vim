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

Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'unblevable/quick-scope'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'matchit.zip'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'moll/vim-bbye'
Plugin 'ervandew/supertab'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" import windows compatibility settings
if has("win32") || has("win64")
	source $VIMRUNTIME/mswin.vim
endif

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

" hide buffers instead of closing them
set hidden

" don't wrap lines
set nowrap

" the encoding displayed
set encoding=utf-8
" the encoding written to file.
set fileencoding=utf-8

" large undo history
set history=1000
set undolevels=1000

" Use whole "words" when opening URLs.
" This avoids cutting off parameters (after '?') and anchors (after '#').
" See http://vi.stackexchange.com/q/2801/1631
let g:netrw_gx="<cWORD>"

" highlight the line the cursor is in
set cursorline

" show whitespace characters
" trail = show trailing whitespace at end of line
" precedes/extends = these show when the line exceeds the buffer width causing horizontal scroll
"set list
set listchars=tab:»\ ,trail:·,precedes:«,extends:»

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
else
	set background=dark
endif

" to fix an issue with highlighting in ConEmu
" https://stackoverflow.com/questions/14315519/conemu-vim-syntax-highlight
if !has("gui_running")
	set term=xterm
	set t_Co=256
	let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Styling/Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable

if has("gui_running")
	set guifont=Consolas:h11
	au GUIEnter * simalt ~x " maximize the window
endif

" tab width = 4 spaces
set tabstop=4
set shiftwidth=4

" set ode folding on indentation
set foldmethod=indent
" expand all folds by default (up to 999 depth)
set foldlevelstart=999

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" retain indentation for new lines
set autoindent
" indent based on the code syntax (used in conjunction with autoindent)
set cindent

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
let mapleader = "\<space>"
nmap , <space>

" tab/shift tab for indentation
" for command mode
nnoremap <S-Tab> <<
nnoremap <Tab> >>
" for insert mode
inoremap <S-Tab> <C-d>

" escape key remaps
inoremap jj <Esc>
inoremap jk <Esc>

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

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" jump to next error
nnoremap <silent> q] :cnext<CR>
nnoremap <silent> q[ :cprevious<CR>

" map escape to clear highlighting from last search
nnoremap <silent> // :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open nerd tree if no files were specified when starting vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" toggle key
map <C-n> :NERDTreeToggle<CR>
" show hidden files
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files
let g:ctrlp_show_hidden = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show lightline even when only single file is open
set laststatus=2

let g:lightline = {
\	'colorscheme': 'wombat',
\	'separator': { 'left': '', 'right': '' },
\	'subseparator': { 'left': '|', 'right': '|' },
\	'active': {
\		'left': [
\			[ 'mode', 'paste' ],
\			[ 'fugitive', 'readonly', 'filename', ] ]
\	},
\	'component_function': {
\		'fugitive': 'LightLineFugitive',
\		'readonly': 'LightLineReadonly',
\		'modified': 'LightLineModified',
\		'filename': 'LightLineFilename'
\	},
\}

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "x"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick-scope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 250ms update interval for detecting changes
set updatetime=250

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BByte (Buffer Bye)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>q :Bdelete<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't delete pairs with backspace
let g:AutoPairsMapBS=0
let g:AutoPairsMapCh=0
" Default {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
let g:AutoPairs={'[':']', '{':'}'}
