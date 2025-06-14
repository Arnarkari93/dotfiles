return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*",                  -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  build = "make install_jsregexp",   -- install jsregexp (optional!).
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local ls = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
  end,
}
