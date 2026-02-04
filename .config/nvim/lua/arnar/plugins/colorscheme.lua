return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark_default')
    -- vim.cmd('colorscheme github_light_default')
    --
    vim.api.nvim_create_user_command('ToggleTheme', function()
      local colo = vim.g.colors_name
      if colo:find('dimmed') then
        vim.cmd('colorscheme github_light_default')
      elseif colo:find('dark') then
        vim.cmd('colorscheme ' .. colo:gsub('dark', 'light'))
      else
        vim.cmd('colorscheme ' .. colo:gsub('light', 'dark'))
      end
    end, {})
  end,
}
-- return {
--   "alljokecake/naysayer-theme.nvim",
--   name = "naysayer",
--   config = function()
--     require('naysayer').setup({
--       variant = 'main',
--       dark_variant = 'main',
--       bold_vert_split = false,
--       dim_nc_background = false,
--       disable_background = true,
--       disable_float_background = true,
--     })
--     vim.cmd("colorscheme naysayer")
--   end
-- }
--
-- return { "rebelot/kanagawa.nvim" }
-- return { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
--"gruvbox-community/gruvbox", -- colorsheme
--"Shatur/neovim-ayu",
--'folke/tokyonight.nvim',
--config = function()
-- require("tokyonight").setup({
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   style = "night",    -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--   light_style = "day", -- The theme is used when the background is set to light
--   transparent = false, -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--   styles = {
--     -- Style to be applied to different syntax groups
--     -- Value is any valid attr-list value for `:help nvim_set_hl`
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {},
--     variables = {},
--     -- Background styles. Can be "dark", "transparent" or "normal"
--     sidebars = "dark",          -- style for sidebars, see below
--     floats = "dark",            -- style for floating windows
--   },
--   sidebars = { "qf", "help" },  -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--   day_brightness = 1,         -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--   dim_inactive = false,         -- dims inactive windows
--   lualine_bold = false,         -- When `true`, section headers in the lualine theme will be bold

--   --- You can override specific color groups to use other groups or a hex color
--   --- function will be called with a ColorScheme table
--   ---@param colors ColorScheme
--   on_colors = function(colors) end,

--   --- You can override specific highlights to use other groups or a hex color
--   --- function will be called with a Highlights and ColorScheme table
--   ---@param highlights Highlights
--   ---@param colors ColorScheme
--   on_highlights = function(highlights, colors) end,
-- })

--end
--}
