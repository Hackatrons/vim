local M = {}

function M.map(mode, shortcut, command, opts)
    vim.api.nvim_set_keymap(mode, shortcut, command, opts or { noremap = true, silent = true })
end

-- insert mode map helper function
function M.imap(shortcut, command, opts)
    M.map('i', shortcut, command, opts)
end

-- normal mode map helper function
function M.nmap(shortcut, command, opts)
    M.map('n', shortcut, command, opts)
end

-- visual mode map helper function
function M.vmap(shortcut, command, opts)
    M.map('v', shortcut, command, opts)
end

return M
