local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

-- auto download packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print('Installing...')
    local packer_url = 'https://github.com/wbthomason/packer.nvim'
    vim.fn.system({ 'git', 'clone', '--depth', '1', packer_url, install_path })

    vim.cmd('packadd packer.nvim')
    install_plugins = true
end

-- recompile the packer loader file upon making changes
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = 'packer_init.lua'
})

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use 'tomasiser/vim-code-dark'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'lewis6991/gitsigns.nvim'
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn["mkdp#util#install"]() end,
        ft = { 'markdown' }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use 'numToStr/Comment.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'tpope/vim-obsession'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'kylechui/nvim-surround',
        tag = "*"
    }

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }
    use 'hrsh7th/cmp-buffer'
    use 'ray-x/lsp_signature.nvim'
end)

local loadConfig = function()
    require('impatient')
    vim.cmd('colorscheme codedark')

    if (vim.g.me_use_icons) then
        vim.cmd('packadd nvim-web-devicons')
        require('nvim-web-devicons').setup()
    end

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
    require('plugins/cmp')
end

if install_plugins then
    vim.api.nvim_create_autocmd('User', {
        pattern = 'PackerComplete',
        once = true,
        callback = function()
            -- close the packer window
            vim.cmd("q")
            -- load the rest of our config
            loadConfig()
        end,
    })

    require('packer').sync()
else
    loadConfig()
end
