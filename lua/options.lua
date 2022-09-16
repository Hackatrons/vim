-- case insensitive searching
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- enable mouse interactivity
vim.opt.mouse = 'a'

-- incremenetal search while typing
vim.opt.incsearch = true

-- enable line numbers
vim.opt.number = true

-- highlight matching braces, brackets, etc
vim.opt.showmatch = true

-- enable row/col ruler
vim.opt.ruler = true

-- allow backspace to delete these characters
vim.opt.backspace = [[indent,eol,start]]

-- hide buffers instead of closing them
vim.opt.hidden = true

-- don't wrap long lines
vim.opt.wrap = false

-- encoding used for display in the terminal/ui
vim.opt.encoding = 'utf-8'

-- encoding used when writing to file
vim.opt.fileencoding = 'utf-8'

-- large undo history
vim.opt.history = 1000
vim.opt.undolevels = 1000

-- auto set the working directory to the directory of the current file
vim.opt.autochdir = true

-- whitespace characters
vim.opt.listchars = 'tab:  |,lead:.,trail:.'
vim.opt.list = true

-- enable high quality colours in terminal
vim.opt.termguicolors = true
