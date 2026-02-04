return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        float = {
          enable = true,
          open_win_config = {
            height = 50,
          }
        },
        width = {
          min = 30,
          max = -1,
        },
        side = 'right',
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
        git_ignored = true,
      },
    })

    vim.keymap.set('n', '<leader>fl', '<cmd>NvimTreeFindFile<CR>')
    vim.keymap.set('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>')
    vim.keymap.set('n', '<leader>fo', '<cmd>NvimTreeOpen<CR>')
    vim.keymap.set('n', '<leader>fc', '<cmd>NvimTreeClose<CR>')
  end,
}

