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
set wildignorecase
set wildmode=list:longest,full

" hide buffers instead of closing them
set hidden

" don't wrap lines
set nowrap

" the encoding displayed
set encoding=utf-8

" the file encoding
set fileencoding=utf-8

" large undo history
set history=1000
set undolevels=1000

" disable error bells
set noerrorbells visualbell t_vb=

if has("gui_running")
    " disable the bell
    autocmd GUIEnter * set visualbell t_vb=
    " maximize the window when running a GUI
    autocmd GUIEnter * simalt ~x
    " remove the menubar
    set guioptions -=m
    " remove the toolbar
    set guioptions -=T
    " remove the right-hand scrollbar
    set guioptions -=r
    " remove right-hand scrollbar when split
    set guioptions -=R
    " remove left-hand scrollbar
    set guioptions -=L
    " remove left-hand scrollbar when split
    set guioptions -=l
endif

" Use whole "words" when opening URLs.
" This avoids cutting off parameters (after '?') and anchors (after '#').
" See http://vi.stackexchange.com/q/2801/1631
let g:netrw_gx="<cWORD>"

" highlight the line the cursor is in
set cursorline

" whitespace characters, use :set list to show them (off by default)
set listchars+=tab:\ \ ┊,lead:.,trail:.

" search down into subfolders
" useful for :find
set path+=**

" auto set the working directory to the directory of the current file
set autochdir

" limit history for 'browse oldfiles' to 10 files
set viminfo='10

" enable file type plugins
filetype plugin on

" enable mouse interaction
set mouse=a
