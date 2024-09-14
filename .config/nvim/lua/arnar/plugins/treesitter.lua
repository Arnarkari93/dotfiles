return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require 'nvim-treesitter.configs'
    configs.setup {
      ensure_installed = {
        "lua", "vim", "javascript", "typescript", "tsx", "luadoc", "vimdoc", "markdown",
      },
      highlight = { -- enable highlighting
        enable = true,
      },
      indent = {
        enable = false, -- default is disabled anyways
      }
    }
  end,
}
