return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require("which-key")

    wk.register({
      p = {
        f = "Find file",
        g = "Git files",
        h = "Help tags",
        w = "Live grep"
      },
      f = {
        name = "File",
        f = { "<cmd>Telescope find_files<cr>", "File" },
        w = { "<cmd>Telescope live_grep<cr>", "Word (grep word)" },
        s = "Save",
        b = { "<cmd>Telescope buffers<cr>", "Buffer" },
      },
      g = {
        name = "Git",
        s = { "<cmd>Telescope git_status<cr>", "Status" },
      },
      s = {
        s = "Spell suggest"
      }
    }, { prefix = "<leader>" })
  end,
}
