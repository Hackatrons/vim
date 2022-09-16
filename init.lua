local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print('Installing packer...')
    local packer_url = 'https://github.com/wbthomason/packer.nvim'
    vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
    print('Done.')

    vim.cmd('packadd packer.nvim')
    install_plugins = true
end

require('packer').startup(function(use)
    -- packer can update itself
    use 'wbthomason/packer.nvim'
    use 'tomasiser/vim-code-dark'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'lewis6991/gitsigns.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    if install_plugins then
        vim.api.nvim_create_autocmd('User', {
            pattern = 'PackerComplete',
            once = true,
            callback = function()
                -- close the packer window
                vim.cmd("bd")
                -- load the rest of our config
                require('config')
            end,
        })

        require('packer').sync()
    else
        require('config')
    end
end)
