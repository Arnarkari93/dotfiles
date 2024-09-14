return {
  { "folke/neoconf.nvim",                       cmd = "Neoconf" },
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
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'norcalli/nvim-colorizer.lua' },
  { "catppuccin/nvim",                          name = "catppuccin", priority = 1000 }
}
