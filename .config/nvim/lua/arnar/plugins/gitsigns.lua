return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()

    vim.keymap.set('n', "<leader>hp", ":Gitsigns preview_hunk<CR>", {desc = "Preview hunk"})
    vim.keymap.set('n', "<leader>hr", ":Gitsigns reset_hunk<CR>", {desc = "Reset hunk"})
    vim.keymap.set('n', "<leader>hn", ":Gitsigns next_hunk<CR>zz", {desc = "Next hunk"})
    vim.keymap.set('n', "<leader>hN", ":Gitsigns prev_hunk<CR>zz", {desc = "Prev hunk"})
    vim.keymap.set('n', "<leader>hs", ":Gitsigns stage_hunk<CR>zz", {desc = "Stage hunk"})
    vim.keymap.set('n', "<leader>hS", ":Gitsigns undo_stage_hunk<CR>zz", {desc = "Undo stage hunk"})
  end
}
