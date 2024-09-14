return {
  'sbdchd/neoformat',
  config = function()
    vim.g.neoformat_try_node_exe = 1

    -- Create an augroup for formatting .cs files
    local format_cs_group = vim.api.nvim_create_augroup('FormatCS', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = format_cs_group,
      pattern = '*.cs',
      command = 'Neoformat csharpier'
    })

    -- Create an augroup for formatting JS/TS files
    local format_js_ts_group = vim.api.nvim_create_augroup('FormatJSTypes', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = format_js_ts_group,
      pattern = { '*.js', '*.ts', '*.tsx' },
      command = 'Neoformat prettier'
    })
  end,
}
