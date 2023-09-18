local map = vim.keymap.set

vim.g.mapleader = " "

vim.opt.pastetoggle = "<F2>"

-- undo
map("n", "<c-z>", "u")
map("i", "<c-z>", "<c-o>u")

-- redo
map("n", "<c-y>", "<c-r>")
map("i", "<c-y>", "<c-o><c-r>")

-- save
map("i", "<c-s>", "<esc>:update<cr>gi")
map("n", "<c-s>", ":update<cr>")

-- copy and paste to system clipboard
map("v", "<c-c>", '"+y')
map("i", "<c-v>", '<c-o>"+gP')
map("n", "<c-v>", '"+gP')

-- paste without copying selected text
map("v", "p", '"0p')

-- select all
map("i", "<c-a>", "<esc>ggVG")
map("n", "<c-a>", "ggVG")

-- shortcut to escape in insert mode
map("i", "jk", "<esc>")

-- reload our vimconfig
map("n", "<leader>sv", ":luafile %<cr>")

-- edit vimconfig
map("n", "<leader>ev", ":e ~/.vim/lua<cr>")

-- switch between buffers
map("n", "<c-n>", ":bnext<cr>")
map("n", "<c-p>", ":bprev<cr>")

-- clear highlighting from last search
map("n", "<esc>", ":noh<cr>")

-- deletes previous word
map("i", "<c-bs>", "<c-w>")
-- control backspace is <c-h> in some terminals
map("i", "<c-h>", "<c-w>")

-- deletes next word
map("i", "<c-del>", "<c-o>dw")

-- select or create a split
function WinMove(key)
    local curwin = vim.fn.winnr()
    vim.cmd.wincmd(key)

    if curwin == vim.fn.winnr() then
        if key == "j" or key == "k" then
            vim.cmd.wincmd("s")
        else
            vim.cmd.wincmd("v")
        end

        vim.cmd.wincmd(key)
    end
end

map("n", "<c-w>k", ":lua WinMove('k')<cr>")
map("n", "<c-w>j", ":lua WinMove('j')<cr>")
map("n", "<c-w>h", ":lua WinMove('h')<cr>")
map("n", "<c-w>l", ":lua WinMove('l')<cr>")

-- jump back and forward
map("n", "gf", "<c-i>")
map("n", "gb", "<c-o>")

-- get back into normal mode while in terminal
map("t", "<esc>", "<c-\\><c-n>")

-- quick bind to close buffers
map("n", "<leader>qq", ":bd!<cr>")

-- paste clipboard in command mode
map("c", "<c-v>", "<c-r>+", { silent = false })

-- delete word backwards
map("c", "<c-bs>", "<c-w>", { silent = false })

-- resize windows
map("n", "<a-right>", ":vertical resize +2<cr>")
map("n", "<a-left>", ":vertical resize -2<cr>")
map("n", "<a-down>", ":resize +2<cr>")
map("n", "<a-up>", ":resize -2<cr>")

-- telescope
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
map("n", "<leader>fg", ":Telescope live_grep<cr>")
map("n", "<leader>fr", ":Telescope resume<cr>")

-- lsp mappings
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspMappings", { clear = true }),
    callback = function(args)
        local options = {
            buffer = args.buf,
            silent = true,
        }

        local telescope = require("telescope.builtin")

        map("n", "<leader>rn", vim.lsp.buf.rename, options)
        map("n", "<a-cr>", vim.lsp.buf.code_action, options)

        map("n", "gd", vim.lsp.buf.definition, options)
        map("n", "gi", vim.lsp.buf.implementation, options)
        map("n", "gr", telescope.lsp_references, options)
        map("n", "<leader>ds", telescope.lsp_document_symbols, options)
        map("n", "<c-t>", telescope.lsp_dynamic_workspace_symbols, options)

        map("n", "K", vim.lsp.buf.hover)

        map("n", "<leader>fd", vim.lsp.buf.format, options)
        -- visual studio keybinding muscle memory
        map("n", "<c-k><c-d>", vim.lsp.buf.format, options)
    end,
})

-- open url under cursor
if vim.fn.has("win32") then
    map("n", "gx", ":!start <cfile><cr>")
else
    map("n", "gx", ":!open <cfile><cr>")
end

-- toggle showing whitespace characters
map("n", "<leader>sw", "<cmd>set list!<cr>")

-- reselect after indenting
map("x", ">", ">gv")
map("x", "<", "<gv")
map("x", "<tab>", ">gv")
map("x", "<s-tab>", "<gv")

-- no neck pain toggle
map("n", "<leader>np", "<cmd>NoNeckPain<cr>")
