require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
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
