local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  local config = function(name)
    return string.format("require('plugins.%s')", name)
  end
  -- My plugins here
  use "wbthomason/packer.nvim"    -- Have packer manage itself
  use "nvim-lua/popup.nvim"       -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"     -- Useful lua functions used ny lots of plugins

  use "gruvbox-community/gruvbox" -- colorsheme
  use "Shatur/neovim-ayu"
  use 'folke/tokyonight.nvim'

  -- Should be a part of vim
  use "tpope/vim-surround"
  use "tpope/vim-abolish"
  use "tpope/vim-commentary"
  use "vim-scripts/ReplaceWithRegister"
  use "bronson/vim-visual-star-search"

  use "christoomey/vim-tmux-navigator"                  -- navigate between vim and tmux panes

  use { "tpope/vim-fugitive", config = config('fugitive') } -- git

  use { "github/copilot.vim", config = config("copilot") }  -- AI autocomplete

  use { 'nvim-treesitter/nvim-treesitter', config = config('treesitter'), run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-context' }

  use 'williamboman/mason.nvim'
  use { 'williamboman/mason-lspconfig.nvim', config = config('lspconfig') }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use { 'hrsh7th/nvim-cmp', config = config('nvim_cmp') }
  use({ "L3MON4D3/LuaSnip", tag = "v1.*" })

  use { 'windwp/nvim-autopairs', config = config('autopairs') }

  use { 'sbdchd/neoformat', config = config('prettier') }
  use {
    'nvim-telescope/telescope.nvim',
    config = config('telescope'),
    requires = { { "nvim-telescope/telescope-live-grep-raw.nvim" } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { "lukas-reineke/indent-blankline.nvim", config = config('indent_blankline') }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = config('lualine')
  }

  use { 'nvim-tree/nvim-tree.lua', config = config('nvim_tree') }
  use { 'norcalli/nvim-colorizer.lua' }
  use({
    "jackMort/ChatGPT.nvim",
    config = config("chatgpt"),
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
