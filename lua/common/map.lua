local M = {}

function M.map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- insert mode map helper function
function M.imap(shortcut, command)
    M.map('i', shortcut, command)
end

-- normal mode map helper function
function M.nmap(shortcut, command)
    M.map('n', shortcut, command)
end

-- visual mode map helper function
function M.vmap(shortcut, command)
    M.map('v', shortcut, command)
end

return M
