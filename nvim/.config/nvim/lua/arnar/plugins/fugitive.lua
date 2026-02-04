return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set('n', '<c-g>', ':Git <cr>', { noremap = true, silent = false })
  end,
}
