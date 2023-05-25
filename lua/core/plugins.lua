-- auto download lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- package management
    'wbthomason/packer.nvim',

    -- color scheme
    {
        'tomasiser/vim-code-dark',
        config = function()
            require('plugins/colours')
        end
    },

    -- bottom status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
    },

    -- buffer tabs
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
    },

    -- git status in sign column
    'lewis6991/gitsigns.nvim',

    -- syntax parsing for styling
    'nvim-treesitter/nvim-treesitter',

    -- toggle comment blocks
    'numToStr/Comment.nvim',

    -- session management
    'tpope/vim-obsession',

    -- change surrounding characters
    {
        'kylechui/nvim-surround'
    },

    -- markdown preview in browser
    {
        'iamcco/markdown-preview.nvim',
        build = function() vim.fn["mkdp#util#install"]() end,
        ft = { 'markdown' }
    },

    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        tag = "0.1.1",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- telescope extension to find the project root directory
    {
        'desdic/telescope-rooter.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' }
    },

    -- file explorer
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
    },

    -- language server protocol configuration
    'neovim/nvim-lspconfig',

    -- show signature help when invoking functions
    'ray-x/lsp_signature.nvim',

    -- package manager for lsps/formatters/linters/daps
    'williamboman/mason.nvim',

    -- auto install lsps via mason
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' }
    },

    -- auto install linters/formatters via mason
    {
        'jayp0521/mason-null-ls.nvim',
        dependencies = { 'williamboman/mason.nvim', 'nvim-lua/plenary.nvim' }
    },

    --  linters and other sources as an lsp
    'jose-elias-alvarez/null-ls.nvim',

    -- auto complete menu
    { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp' } },

    -- completion source for buffer content
    'hrsh7th/cmp-buffer',

    -- snippet engine
    { 'L3MON4D3/LuaSnip', dependencies = { 'saadparwaiz1/cmp_luasnip' } },

    -- various language snippets
    'rafamadriz/friendly-snippets',

    -- ui improvements
    'stevearc/dressing.nvim',
}

if (vim.g.me_use_icons) then
    vim.cmd.packadd('nvim-web-devicons')
    require('nvim-web-devicons').setup()
end

require('lazy').setup(plugins)
require('nvim-surround').setup()
require('plugins/comment')
require('plugins/lualine')
require('plugins/bufferline')
require('plugins/gitsigns')
require('plugins/telescope')
require('plugins/disable')
require('plugins/tree')
require('plugins/obsession')
require('plugins/treesitter')
require('plugins/lsp')
require('plugins/null-ls')
require('plugins/cmp')
require('plugins/snippets')
