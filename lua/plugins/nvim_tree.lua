require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = {
      min = 30,
      max = -1,
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set('n', '<leader>fl', '<cmd>NvimTreeFindFile<CR>')
vim.keymap.set('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>fo', '<cmd>NvimTreeOpen<CR>')
vim.keymap.set('n', '<leader>fc', '<cmd>NvimTreeClose<CR>')
