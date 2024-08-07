-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- plugins are configured after this line between the brackets
require("lazy").setup({
	{
		-- Install and set the current theme to kanagawa.nvim
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd.colorscheme("kanagawa-dragon")
		end,
	},
    {
        'xero/miasma.nvim',
    },
    {
        'rose-pine/neovim', name = 'rose-pine',
    },
	{
		-- install and configure treesitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "cpp", "python" }, -- if you want syntax highlighting for additional languages, add them into the array
				highlight = { enable = true }, -- enable syntax highlighting
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim", -- install telescope.nvim, a file browser in neovim
		dependencies = { "nvim-lua/plenary.nvim" }, -- install plenary.nvim, a dependancy for telescope
	},
	{
        "neovim/nvim-lspconfig", -- Install lspconfig
    },
	{
		"williamboman/mason.nvim", -- Install mason.nvim, if you type the command Mason in neovim, you will be able to download linters and language servers to your heart's content
		config = function()
			require("mason").setup()
		end,
	},
	{
        "williamboman/mason-lspconfig.nvim", -- Install mason-lspconfig, which will automatically use the language servers we installed with mason when we open a suitable file
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
        end,
    },
    {

        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                -- config
            })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },

    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp'},
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    end,
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({select = true}),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                },
                sources = cmp.config.sources({
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                }),
            })
        end,
    },
})
