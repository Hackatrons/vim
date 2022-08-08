" map ; to : for quicker command execution e.g. ;e is faster to type than :e
nnoremap ; :

" set leader key
let mapleader = "\<space>"

" Y by default acts like yy
" make it yank until EOL, similar to D and C
map Y y$

" escape key remaps
inoremap <expr> jk pumvisible() ? "" : "<Esc>"

" paste mode
set pastetoggle=<F2>

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Quickly edit/reload the vimrc file
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
