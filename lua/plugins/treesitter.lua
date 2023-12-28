local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = {"lua", "vim", "javascript", "typescript", "tsx"},
  highlight = { -- enable highlighting
    enable = true,
  },
  indent = {
    enable = false, -- default is disabled anyways
  }
}
