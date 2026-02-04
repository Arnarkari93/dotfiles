return {
  "folke/neoconf.nvim",
  "folke/neodev.nvim",
  "nvim-lua/popup.nvim",   -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

  -- Should be a part of vim
  "tpope/vim-surround",
  "tpope/vim-abolish",
  "tpope/vim-commentary",
  "vim-scripts/ReplaceWithRegister",
  "bronson/vim-visual-star-search",

  "christoomey/vim-tmux-navigator", -- navigate between vim and tmux panes
  'williamboman/mason.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'norcalli/nvim-colorizer.lua' },
  { "catppuccin/nvim",                          name = "catppuccin", priority = 1000 },
  {
    "Cliffback/netcoredbg-macOS-arm64.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require('netcoredbg-macOS-arm64').setup(require('dap'))
    end
  }
}
