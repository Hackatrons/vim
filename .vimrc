" Plugins are loading using the Vim pack feature
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

" whitespace characters
" trail = show trailing whitespace at end of line
" precedes/extends = these show when the line exceeds the buffer width causing horizontal scroll
"set list
set listchars=tab:»\ ,trail:·,precedes:«,extends:»

" search down into subfolders
" useful for :find
set path+=**

" the directory to use for swap files
" ^= means to prepend the directory to the list of directories to use
" // at the end means to use the file path name in the swap file to avoid filename collisions
set directory^=$HOME/.vim/tmp//

" auto set the working directory to the directory of the current file
set autochdir

" limit history for 'browse oldfiles' to 10 files
set viminfo='10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colour Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
" load palenight
packadd! palenight.vim
colorscheme palenight

" to fix an issue with highlighting in ConEmu
" https://stackoverflow.com/questions/14315519/conemu-vim-syntax-highlight
if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    " mouse scrol fixes
    " https://github.com/Maximus5/ConEmu/issues/1007
    inoremap <Esc>[62~ <C-X><C-E>
    inoremap <Esc>[63~ <C-X><C-Y>
    nnoremap <Esc>[62~ <C-E>
    nnoremap <Esc>[63~ <C-Y>
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Styling/Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable

if has("gui_running")
    set guifont=Consolas:h11
endif

" tab width = 4 spaces
set tabstop=4
set shiftwidth=4
" convert tabs to spaces
set expandtab

" set folding method on indentation
set foldmethod=indent
" expand all folds by default (up to 999 depth)
set foldlevelstart=999

" retain indentation for new lines
set autoindent
" indent based on the code syntax (used in conjunction with autoindent)
set cindent

" disable automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map ; to : for quicker command execution e.g. ;e is faster to type than :e
nnoremap ; :

" set leader key
let mapleader = "\<space>"
nmap , <space>

" Y by default acts like yy
" make it yank until EOL, similar to D and C
map Y y$

" escape key remaps
inoremap <expr> jk pumvisible() ? "" : "<Esc>"

" paste mode
set pastetoggle=<F2>

" backspace fix for ConEmu
" https://github.com/Maximus5/ConEmu/issues/641
if !has("gui_running")
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
endif

" Use ctrl-[hjkl] to select the active split
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

" map // to clear highlighting from last search
nnoremap <silent> // :noh<cr>

" leader yy = copy all to clipboard
nnoremap <leader>yy :%y+<CR>

" fast way to set the current file mode to javascript as I regularly open files that don't have an extension
nnoremap <leader>js :setf javascript<CR>

" ctrl + backspace deletes previous word
imap <C-BS> <C-W>

" ctrl + delete deletes next word
imap <C-Del> <C-O>dw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files
let g:ctrlp_show_hidden = 1
" use ctrl+t instead of ctrl+p
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show lightline even when only single file is open
set laststatus=2
" hide the inbuilt mode display
set noshowmode
let g:lightline = {
            \	'colorscheme': 'palenight',
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
            \		'filename': 'LightLineFilename',
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
" BByte (Buffer Bye)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>q :Bdelete<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimwiki configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default mapping is <C-Space> (CTRL + Space) but for some reason it doesn't work
" which might be because my leader key is Space
map <Leader>tt <Plug>VimwikiToggleListItem

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IndentLine configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_setConceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline integration
let g:airline#extensions#ale#enabled = 1
" don't show the left hand sign column
let g:ale_set_signs = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buftabline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
