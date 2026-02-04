local augroup = vim.api.nvim_create_augroup('highlight_yank', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = augroup,
  callback = function()
    vim.highlight.on_yank({timeout = 40})
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    command = "setlocal commentstring=--\\ %s",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- 2. Soft Wrap: If a line is long, wrap it visually
    vim.opt_local.wrap = true
    -- 3. Linebreak: Don't break words in the middle of a wrap
    vim.opt_local.linebreak = true
  end,
})
