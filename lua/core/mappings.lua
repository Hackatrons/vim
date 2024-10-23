local map = vim.keymap.set

vim.g.mapleader = " "

-- undo
map("n", "<c-z>", "u")
map("i", "<c-z>", "<c-o>u")

-- redo
map("n", "<c-y>", "<c-r>")
map("i", "<c-y>", "<c-o><c-r>")

-- save
map("i", "<c-s>", "<cmd>update<cr>")
map("n", "<c-s>", "<cmd>update<cr>")

-- copy and paste to system clipboard
map("v", "<c-c>", '"+y')
map("i", "<c-v>", '<c-o>"+gP')
map("n", "<c-v>", '"+gP')

-- paste without copying selected text
map("v", "p", '"0p')

-- cut without copying
map("n", "x", '"_x')

-- select all
map("i", "<c-a>", "<esc>ggVG")
map("n", "<c-a>", "ggVG")

-- shortcut to escape in insert mode
map("i", "jk", "<esc>")

-- reload our vimconfig
map("n", "<leader>sv", "<cmd>luafile %<cr>")

-- edit vimconfig
map("n", "<leader>ev", "<cmd>e ~/.vim/lua<cr>")

-- switch between buffers
map("n", "<c-n>", "<cmd>bnext<cr>")
map("n", "<c-p>", "<cmd>bprev<cr>")

-- clear highlighting from last search
map("n", "<esc>", "<cmd>noh<cr>")

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

map("n", "<c-w>k", "<cmd>lua WinMove('k')<cr>")
map("n", "<c-w>j", "<cmd>lua WinMove('j')<cr>")
map("n", "<c-w>h", "<cmd>lua WinMove('h')<cr>")
map("n", "<c-w>l", "<cmd>lua WinMove('l')<cr>")
map("n", "<c-w>x", "<cmd>close<cr>")

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
map("n", "<a-right>", "<cmd>vertical resize +2<cr>")
map("n", "<a-left>", "<cmd>vertical resize -2<cr>")
map("n", "<a-down>", "<cmd>resize +2<cr>")
map("n", "<a-up>", "<cmd>resize -2<cr>")

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fr", "<cmd>Telescope resume<cr>")

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

        -- show documentation
        map("i", "<c-space>", vim.lsp.buf.signature_help, options)
        map("i", "<c-k>", vim.lsp.buf.signature_help, options)
    end,
})

-- open url under cursor
if vim.fn.has("win32") then
    map("n", "gx", "<cmd>!start <cfile><cr>")
else
    map("n", "gx", "<cmd>!open <cfile><cr>")
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

-- session management
map("n", "<leader>wf", "<cmd>SessionSearch<CR>", { desc = "Session search" })
map("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Session restore" })
map("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session" })

-- file explorer
map("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle explorer" })
map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Find current file in explorer" })

-- resharper muscle memory
map("n", "<s-a-l>", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Find current file in explorer" })

local function format()
    require("conform").format()
end

map({ "n", "v" }, "<leader>fd", format, { desc = "Format file or range (in visual mode)" })
-- visual studio keybinding muscle memory
map({ "n", "v" }, "<c-k><c-d>", format, { desc = "Format file or range (in visual mode)" })
