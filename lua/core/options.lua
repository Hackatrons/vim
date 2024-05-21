local opt = vim.opt

opt.background = "dark"

if vim.fn.has("termguicolors") == 1 then
    opt.termguicolors = true
end

-- tab width equivalent in spaces
opt.tabstop = 4
opt.shiftwidth = 4

-- convert tabs to spaces
opt.expandtab = true

-- retain indentation for new lines
opt.autoindent = true

-- indent based on the code syntax
opt.cindent = true

-- use devicons with neovide
-- disable them for other UIs that haven't got a patched font configured
vim.g.me_enable_icons = vim.g.neovide or false

-- disable animated scrolling as it makes me motion sick
vim.g.neovide_scroll_animation_length = 0

-- case insensitive searching
opt.smartcase = true
opt.ignorecase = true

-- enable mouse interactivity
opt.mouse = "a"

-- incremenetal search while typing
opt.incsearch = true

-- enable line numbers
opt.number = true

-- highlight matching braces, brackets, etc
opt.showmatch = true

-- enable row/col ruler
opt.ruler = true

-- allow backspace to delete these characters
opt.backspace = "indent,eol,start"

-- hide buffers instead of closing them
opt.hidden = true

-- don't wrap long lines
opt.wrap = false

-- encoding used for display in the terminal/ui
opt.encoding = "utf-8"

-- encoding used when writing to file
opt.fileencoding = "utf-8"

-- large undo history
opt.history = 1000
opt.undolevels = 1000

-- whitespace characters
opt.listchars = "tab:>- ,lead:.,trail:."

-- persist undo history
opt.undofile = true

-- set the window title to the filename
opt.title = true
opt.titlestring = "%t"

opt.spelllang = "en_au"

-- limit to 10 suggestions
opt.spellsuggest = "10"

-- hide the command line when not used
opt.cmdheight = 0

if vim.fn.has("win32") == 1 then
    opt.guifont = "Cascadia Mono:h14"
end

-- popup menu behaviour
opt.completeopt = { "menu", "menuone", "noselect" }

-- disable the intro screen
vim.o.shortmess = vim.o.shortmess .. "I"

-- disable swap files
vim.o.swapfile = false
