local augroup = vim.api.nvim_create_augroup('highlight_yank', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = augroup,
  command = "lua require'vim.highlight'.on_yank({timeout = 40})"
})
