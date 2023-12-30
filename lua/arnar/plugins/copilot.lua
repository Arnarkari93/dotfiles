return {
  "github/copilot.vim",
  config = function()
    local keymap = vim.api.nvim_set_keymap
    keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = false })

    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_assume_mapped_key = '<C-J>'
    -- vim.g.copilot_tab_fallback = ""
    vim.g.copilot_node_command = '~/.nvm/versions/node/v16.14.2/bin/node'
  end
}
