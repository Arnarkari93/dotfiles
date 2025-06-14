return {
  'nvim-telescope/telescope.nvim',
  dependencies = { { "nvim-telescope/telescope-live-grep-args.nvim" } },
  config = function()
    local function nkeymap(key, map, opts)
      opts = opts or {}
      vim.api.nvim_set_keymap('n', key, map, opts)
    end

    local action_layout = require("telescope.actions.layout")
    local actions = require("telescope.actions")

    require('telescope').setup {
      layout_config = {
        vertical = {
          prompt_position = "bottom",
          mirror = true,
        },
      },
      defaults = {
        path_display = { "filename_first" },
        mappings = {
          n = {
            ["<C-p>"] = action_layout.toggle_preview,
            ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<Right>"] = actions.cycle_history_next,
            ["<Left>"] = actions.cycle_history_prev,
          },
          i = {
            ["<C-p>"] = action_layout.toggle_preview,
            ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default="smart_case"
        },
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
        }
      }
    }
    --
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
    require("telescope").load_extension("live_grep_args")
    nkeymap('<leader>pr', '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>')

    nkeymap('<leader>pf', '<cmd>lua require("telescope.builtin").find_files()<cr>')
    nkeymap('<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { desc = "Find files" })
    nkeymap('<leader>pF', '<cmd>lua require("telescope.builtin").find_files({ hidden=true, no_ignore=true, no_ignore_parent=true })<cr>')
    nkeymap('<leader>fF', '<cmd>lua require("telescope.builtin").find_files({ hidden=true, no_ignore=true, no_ignore_parent=true })<cr>', {})
    nkeymap('<leader>pd',
      '<cmd>lua require("telescope.builtin").find_files({ find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" } })<cr>')
    nkeymap('<leader>pg', '<cmd>lua require("telescope.builtin").git_files()<cr>')
    nkeymap('<leader>pw', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
    nkeymap('<leader>pW', '<cmd>lua require("telescope.builtin").live_grep({ hidden=true })<cr>')

    nkeymap('<leader>sb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
    nkeymap('<leader>ph', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
    nkeymap('<leader>hi', '<cmd>lua require("telescope.builtin").oldfiles()<cr>')
    nkeymap('<leader>ss', '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
    nkeymap('<leader>gs', '<cmd>lua require("telescope.builtin").git_status()<cr>')
    nkeymap('<leader>fw', '<cmd>lua require("telescope.builtin").grep_string()<cr>')
  end,
}
