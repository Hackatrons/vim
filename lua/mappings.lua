function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- insert mode map helper function
function imap(shortcut, command)
    map('i', shortcut, command)
end

-- normal mode map helper function
function nmap(shortcut, command)
    map('n', shortcut, command)
end

-- visual mode map helper function
function vmap(shortcut, command)
    map('v', shortcut, command)
end

vim.g.mapleader = ' '

vim.opt.pastetoggle = '<F2>'

-- undo
nmap('<c-z>', 'u')
imap('<c-z>', '<c-o>u')

-- redo
nmap('<c-y>', '<c-r>')
imap('<c-y>', '<c-o><c-r>')

-- save
imap('<c-s>', '<esc>:update<cr>gi')
nmap('<c-s>', ':update<cr>')

-- copy and paste to system clipboard
vmap('<c-c>', '"+y')
imap('<c-v>', '<c-o>"+gP')
nmap('<c-v>', '"+gP')

-- shortcut to escape in insert mode
imap('jk', '<esc>')

-- easier to type ;w than :w
nmap(';', ':')

-- reload our vimconfig
nmap('<leader>sv', ':luafile %<cr>')

-- switch between buffers
nmap('<c-n>', ':bnext<cr>')
nmap('<c-p>', ':bprev<cr>')

-- bring up buffer menu
nmap('<leader>b', ':ls<cr>')

-- clear highlighting from last search
nmap('//', ':noh<cr>')

-- deletes previous word
imap('<c-bs>', '<c-w>')

-- deletes next word
imap('<c-del>', '<c-o>dw')

-- select the active split
nmap('<c-k>', ':wincmd k<cr>')
nmap('<c-j>', ':wincmd j<cr>')
nmap('<c-h>', ':wincmd h<cr>')
nmap('<c-l>', ':wincmd l<cr>')

-- jump back and forward
nmap('gf', '<c-i>')
nmap('gb', '<c-o>')

-- get back into normal mode while in terminal
map('t', '<esc>', '<c-\\><c-n>')
