colorscheme codedark

if has('nvim')
    set termguicolors
endif

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
