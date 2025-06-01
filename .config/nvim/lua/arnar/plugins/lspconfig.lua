return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    local opts = { noremap = true, silent = false }
    local function nkeymap(key, map)
      vim.api.nvim_set_keymap('n', key, map, opts)
    end

    nkeymap(',gg', ':lua vim.lsp.buf.definition()<cr>')
    nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
    nkeymap(',gd', ':lua vim.lsp.buf.definition()<cr>')
    nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
    nkeymap(',gt', ':lua vim.lsp.buf.type_definition()<cr>')
    nkeymap(',gD', ':lua vim.lsp.buf.declaration()<cr>')
    nkeymap(',gi', ':lua vim.lsp.buf.implementation()<cr>')
    nkeymap(',gw', ':lua vim.lsp.buf.document_symbol()<cr>')
    nkeymap(',gW', ':lua vim.lsp.buf.workspace_symbol()<cr>')
    nkeymap(',gr', ':lua vim.lsp.buf.references()<cr>')
    nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
    nkeymap('<leader>sh', ':lua vim.lsp.buf.signature_help()<cr>')
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = "LSP signature help" })

    nkeymap('<leader>ca', ':lua vim.lsp.buf.code_action()<cr>')
    nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
    nkeymap('<leader>en', ':lua vim.diagnostic.goto_next()<cr>')
    nkeymap('<leader>eN', ':lua vim.diagnostic.goto_prev()<cr>')
    nkeymap('<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>')
    nkeymap(',ff', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },

    }

    lspconfig.denols.setup({
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      capabilities = capabilities,
      on_attach = function(client)
        client.server_capabilities.document_formatting = true
      end,
      init_options = {
        lint = true,
      }
    })

    lspconfig.ts_ls.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- Check if the project has a Deno config (meaning it's a Deno project)
        local root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd())

        -- If it's a Deno project, don't attach tsserver
        if root_dir then
          client.stop() -- Stop tsserver in Deno projects
          return
        end

        -- Disable formatting, as you might prefer other tools (e.g., prettier)
        client.server_capabilities.document_formatting = false

        require("lsp_signature").on_attach({
          bind = true,
          floating_window = true,
          hint_enable = true,
          handler_opts = {
            border = "rounded"
          }
        }, bufnr)
      end,
    }

    lspconfig.gopls.setup {
      settings = {
        gopls = {
          staticcheck = true,
        },
      },
    }

    lspconfig.csharp_ls.setup({
      capabilities = capabilities
    })

    lspconfig.eslint.setup({
      capabilities = capabilities
    })

    lspconfig.terraformls.setup({
      capabilities = capabilities
    })

    lspconfig.cssls.setup({
      capabilities = capabilities
    })
  end
}
