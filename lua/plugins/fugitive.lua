local opts = { noremap = true, silent = false }

---- shorten function name
local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map, customOpts)
  if customOpts then
    keymap("n", key, map, customOpts)
  else
    keymap("n", key, map, opts)
  end
end

nkeymap('<c-g>', ':Git', opts)
