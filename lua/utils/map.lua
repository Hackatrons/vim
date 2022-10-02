local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  -- note: noremap is defaulted to true using this method
  vim.keymap.set(mode, lhs, rhs, options)
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
