return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets', -- Optional: common snippets
    'petertriho/cmp-git',           -- Optional: for git commit completions
    'kristijanhusak/vim-dadbod-completion', -- Optional: for SQL completion
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        -- Uncomment to enable borders:
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            local copilot_keys = vim.fn["copilot#Accept"] and vim.fn["copilot#Accept"]("") or ""
            if copilot_keys ~= "" then
              vim.api.nvim_feedkeys(copilot_keys, "i", true)
            else
              fallback()
            end
          end
        end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              cmp.confirm({ select = true })
            end
          else
            fallback()
          end
        end),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'copilot' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),
    })

    -- Git commit filetype
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' },
      }, {
        { name = 'buffer' },
      }),
    })

    -- SQL filetype
    cmp.setup.filetype('sql', {
      sources = cmp.config.sources({
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
      }),
    })

    -- `/` command line search
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- `:` command line
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
}
