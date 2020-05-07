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
call mkdir($HOME . "/.vim/tmp/", "p")
set directory^=$HOME/.vim/tmp//

" auto set the working directory to the directory of the current file
set autochdir

" limit history for 'browse oldfiles' to 10 files
set viminfo='10

" for gVim on windows, requires placing gvimfullscreen.dll in the vim installation folder
" https://github.com/derekmcloughlin/gvimfullscreen_win32/tree/master
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" required for NerdCommentor to know what type of comment characters to use
filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colour Scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme palenight

" Conemu setup
if !has('nvim') && !empty($CONEMUHOOKS)
    " to fix an issue with highlighting in ConEmu
    " https://stackoverflow.com/questions/14315519/conemu-vim-syntax-highlight
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    " mouse scroll fixes
    " https://github.com/Maximus5/ConEmu/issues/1007
    inoremap <Esc>[62~ <C-X><C-E>
    inoremap <Esc>[63~ <C-X><C-Y>
    nnoremap <Esc>[62~ <C-E>
    nnoremap <Esc>[63~ <C-Y>

    " fix backspace key
    " https://github.com/Maximus5/ConEmu/issues/1900
    let &t_kb="\xcex"
    let &t_kD="\xceS"
endif

if has('nvim')
    set termguicolors
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
inoremap <expr> kj pumvisible() ? "" : "<Esc>"

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
nmap <silent> <leader>ev :e ~/.vim/.vimrc<CR>
nmap <silent> <leader>ec :e ~/.vim/config.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vim/.vimrc<CR>

" jump to next error
nnoremap <silent> q] :cnext<CR>
nnoremap <silent> q[ :cprevious<CR>

" map // to clear highlighting from last search
set nohlsearch
nnoremap <silent> // :noh<cr>

" leader yy = copy all to clipboard
nnoremap <leader>yy :%y+<CR>

" ctrl + backspace deletes previous word
imap <C-BS> <C-W>

" ctrl + delete deletes next word
imap <C-Del> <C-O>dw

" navigate back and forward
nnoremap gf <c-i>
nnoremap gb <c-o>

" bind escape to get back into normal mode when in a terminal window
tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files
let NERDTreeShowHidden=1
" auto close after opening a file
let NERDTreeQuitOnOpen=1
nmap <leader>ne :NERDTreeToggle<CR>
" select the current file in the tree
nmap <leader>nn :NERDTreeFind<CR>
" hide the help text
let NERDTreeMinimalUI = 1

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
            \			[ 'cocstatus', 'fugitive', 'readonly', 'filename', ] ]
            \	},
            \	'component_function': {
            \		'fugitive': 'LightLineFugitive',
            \		'readonly': 'LightLineReadonly',
            \		'modified': 'LightLineModified',
            \		'filename': 'LightLineFilename',
            \       'cocstatus': 'coc#status',
            \	},
            \}

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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
" BByte (Buffer Bye)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>qq :Bdelete<CR>

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

" hide the gui tab line as it doesn't seem to work well in nvim-qt
if has('nvim')
    autocmd VimEnter * GuiPopupmenu 0
    autocmd VimEnter * GuiTabline 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" format a markdown table, align on all occurrences of '|'
xmap <leader>ft ga*\|<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
"set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <Tab> to confirm autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" alt j and k for moving up and down the autocomplete menu
inoremap <silent><expr> <A-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><A-k> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Show signature help while editing
autocmd CursorHoldI * silent! call CocAction('showSignatureHelp')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <a-cr>  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier', 'coc-json', 'coc-css', 'coc-omnisharp', 'coc-markdownlint' ]

" the default red text for errors is too harsh, lighten it a bit
hi CocErrorSign  ctermfg=Red guifg=#ff1c1c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" omnisharp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the stdio version of OmniSharp-roslyn:
let g:OmniSharp_server_stdio = 1
