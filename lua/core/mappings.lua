local m = require('utils/map')

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

-- paste clipboard in command mode
m.map('c', '<c-v>', '<c-r>+', { silent = false })

-- delete word backwards
m.map('c', '<c-bs>', '<c-w>', { silent = false })

-- resize windows
m.nmap('<a-right>', ':vertical resize +2<cr>')
m.nmap('<a-left>', ':vertical resize -2<cr>')
m.nmap('<a-down>', ':resize +2<cr>')
m.nmap('<a-up>', ':resize -2<cr>')

-- telescope
m.nmap('<leader>ff', ':Telescope find_files<cr>')
m.nmap('<leader>fb', ':Telescope buffers<cr>')
m.nmap('<leader>fg', ':Telescope git_files<cr>')

-- lsp mappings
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('LspMappings', { clear = true }),
    callback = function(args)
        local options = {
            buffer = args.buf,
            silent = true
        }

        local telescope = require('telescope.builtin')

        m.nmap('<leader>rn', vim.lsp.buf.rename, options)
        m.nmap('<a-cr>', vim.lsp.buf.code_action, options)

        m.nmap('gd', vim.lsp.buf.definition, options)
        m.nmap('gi', vim.lsp.buf.implementation, options)
        m.nmap('gr', telescope.lsp_references, options)
        m.nmap('<leader>ds', telescope.lsp_document_symbols, options)
        m.nmap('<c-t>', telescope.lsp_dynamic_workspace_symbols, options)

        m.nmap('K', vim.lsp.buf.hover)

        m.nmap('<leader>fd', vim.lsp.buf.format, options)
        -- visual studio keybinding muscle memory
        m.nmap('<c-k><c-d>', vim.lsp.buf.format, options)
    end
})

-- open url under cursor
if (vim.fn.has('win32')) then
    m.nmap('gx', ':!start <cfile><cr>')
else
    m.nmap('gx', ':!open <cfile><cr>')
end

-- toggle showing whitespace characters
m.nmap('<leader>sw', function() vim.opt.list = true end)
m.nmap('<leader>hw', function() vim.opt.list = false end)
