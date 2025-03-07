local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself	
	use("preservim/nerdtree")
	use("sheerun/vim-polyglot")
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use("terrortylor/nvim-comment")
	use("tpope/vim-surround")
	use("lewis6991/gitsigns.nvim")
	use { "NeogitOrg/neogit", tag="v0.0.1" }
	use "sindrets/diffview.nvim"
	-- use 'jreybert/vimagit'
	use { "neoclide/coc.nvim", branch = "release" }
	use "vim-airline/vim-airline"
	use 'vim-airline/vim-airline-themes'
	-- use 'tpope/vim-fugitive'
	-- use 'liangxianzhe/nap.nvim'
	use 'ggandor/leap.nvim'
	-- simple format
	use 'vim-autoformat/vim-autoformat'
	use {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	}
	-- use "voldikss/vim-floaterm"
	use "fannheyward/telescope-coc.nvim"
	use 'vimlab/split-term.vim'
	-- use "pseewald/vim-anyfold"
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
