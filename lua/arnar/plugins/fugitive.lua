return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set('n', '<c-g>', ':Git', { noremap = true, silent = false })
  end,
}
