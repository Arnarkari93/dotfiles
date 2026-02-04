return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require 'nvim-treesitter.configs'
    configs.setup {
      ensure_installed = {
        "lua", "vim", "javascript", "typescript", "tsx", "luadoc", "vimdoc", "markdown", "bash", "c_sharp"
      },
      highlight = { -- enable highlighting
        enable = true,
      },
      indent = {
        enable = false, -- default is disabled anyways
      }
    }
    vim.filetype.add({
      pattern = {
        [".*%.env.*"] = "bash",
      },
    })
    vim.treesitter.language.register("c_sharp", "cs")
    vim.treesitter.language.register("c_sharp", "csharp")
  end,
}
