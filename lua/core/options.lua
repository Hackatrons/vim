local opt = vim.opt

-- case insensitive searching
opt.smartcase = true
opt.ignorecase = true

-- enable mouse interactivity
opt.mouse = 'a'

-- incremenetal search while typing
opt.incsearch = true

-- enable line numbers
opt.number = true

-- highlight matching braces, brackets, etc
opt.showmatch = true

-- enable row/col ruler
opt.ruler = true

-- allow backspace to delete these characters
opt.backspace = [[indent,eol,start]]

-- hide buffers instead of closing them
opt.hidden = true

-- don't wrap long lines
opt.wrap = false

-- encoding used for display in the terminal/ui
opt.encoding = 'utf-8'

-- encoding used when writing to file
opt.fileencoding = 'utf-8'

-- large undo history
opt.history = 1000
opt.undolevels = 1000

-- auto set the working directory to the directory of the current file
opt.autochdir = true

-- whitespace characters
opt.listchars = 'tab:  |,lead:.,trail:.'
opt.list = true

-- persist undo history
opt.undofile = true

-- set the window title to the filename
opt.title = true
opt.titlestring = '%t'

opt.spelllang = 'en_au'

-- limit to 10 suggestions
opt.spellsuggest = '10'

-- Enable spellchecking in markdown, text, and gitcommit files
local spell_group = vim.api.nvim_create_augroup('Spelling', { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "markdown", "text" },
    group = spell_group,
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- hide the command line when not used
opt.cmdheight = 0
