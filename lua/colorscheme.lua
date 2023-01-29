local colorscheme = "ayu-mirage" -- "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local ayuColor = require('ayu.colors')
require('ayu').setup({
  mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
  overrides = {
    NonText = { fg = ayuColor.ui },
    LineNr = { fg = ayuColor.ui },
  }, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})
