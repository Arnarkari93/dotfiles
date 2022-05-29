local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

local keymap = vim.api.nvim_set_keymap
keymap('i', '<C-J>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

vim.g.copilot_no_tab_map = true
