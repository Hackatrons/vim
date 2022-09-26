local m = require('common/map')

vim.g.mapleader = ' '

vim.opt.pastetoggle = '<F2>'

-- undo
m.nmap('<c-z>', 'u')
m.imap('<c-z>', '<c-o>u')

-- redo
m.nmap('<c-y>', '<c-r>')
m.imap('<c-y>', '<c-o><c-r>')

-- save
m.imap('<c-s>', '<esc>:update<cr>gi')
m.nmap('<c-s>', ':update<cr>')

-- copy and paste to system clipboard
m.vmap('<c-c>', '"+y')
m.imap('<c-v>', '<c-o>"+gP')
m.nmap('<c-v>', '"+gP')

-- select all
m.imap('<c-a>', '<esc>ggVG')
m.nmap('<c-a>', 'ggVG')

-- shortcut to escape in insert mode
m.imap('jk', '<esc>')

-- easier to type ;w than :w
m.nmap(';', ':')

-- reload our vimconfig
m.nmap('<leader>sv', ':luafile %<cr>')

-- switch between buffers
m.nmap('<c-n>', ':bnext<cr>')
m.nmap('<c-p>', ':bprev<cr>')

-- clear highlighting from last search
m.nmap('//', ':noh<cr>')

-- deletes previous word
m.imap('<c-bs>', '<c-w>')

-- deletes next word
m.imap('<c-del>', '<c-o>dw')

-- select the active split
m.nmap('<c-k>', ':wincmd k<cr>')
m.nmap('<c-j>', ':wincmd j<cr>')
m.nmap('<c-h>', ':wincmd h<cr>')
m.nmap('<c-l>', ':wincmd l<cr>')

-- jump back and forward
m.nmap('gf', '<c-i>')
m.nmap('gb', '<c-o>')

-- get back into normal mode while in terminal
m.map('t', '<esc>', '<c-\\><c-n>')

-- quick bind to close buffers
m.nmap('<leader>qq', ':bd!<cr>')

-- toggle line comment
-- specify noremap to false as the plugin won't have loaded yet
m.vmap('<leader>cc', 'gc', { noremap = false })
m.nmap('<leader>cc', 'gcc', { noremap = false })

-- bring up fuzzy finders
m.nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
m.nmap('<leader>fb', '<cmd>Telescope buffers<cr>')

-- show file explorer
m.nmap('<leader>sf', ':NvimTreeToggle<cr>')
