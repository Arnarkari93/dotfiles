return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls", "denols", "gopls" },
      automatic_installation = true,
    })

    local opts = { noremap = true, silent = false }
    local function nkeymap(key, map)
      vim.api.nvim_set_keymap('n', key, map, opts)
    end

    vim.keymap.del("n", "grn");
    vim.keymap.del("n", "grt");
    vim.keymap.del("n", "gri");
    vim.keymap.del("n", "gra");
    vim.keymap.del("x", "gra");

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

    -- Setup capabilities
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Lua Language Server
    vim.lsp.config.lua_ls = {
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
      capabilities = capabilities,
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
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

    vim.lsp.config.omnisharp = {
      cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    }

    -- Deno Language Server (only for Deno projects with deno.json/deno.jsonc)
    vim.lsp.config.denols = {
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/deno", "lsp" },
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
      root_markers = { "deno.json", "deno.jsonc" },
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- Verify we're actually in a Deno project
        local deno_config = vim.fs.find({ "deno.json", "deno.jsonc" }, {
          upward = true,
          path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
        })[1]

        -- If no Deno config found, this shouldn't have started - stop it
        if not deno_config then
          client.stop()
          return
        end

        -- If there's also a package.json (indicating Node.js project), prefer TypeScript LSP
        local package_json = vim.fs.find({ "package.json" }, {
          upward = true,
          path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
        })[1]

        if package_json then
          client.stop()
          return
        end

        client.server_capabilities.document_formatting = true
      end,
      init_options = {
        lint = true,
      }
    }

    -- TypeScript Language Server
    vim.lsp.config.ts_ls = {
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server", "--stdio" },
      capabilities = capabilities,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
      root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
      on_attach = function(client, bufnr)
        -- Check if the project has a Deno config (meaning it's a Deno project)
        local root_dir = vim.fs.find({ "deno.json", "deno.jsonc" }, {
          upward = true,
          path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
        })[1]

        -- If it's a Deno project, don't attach tsserver
        if root_dir then
          client.stop() -- Stop tsserver in Deno projects
          return
        end

        -- If we're in a non-Deno project, stop any Deno LSP that might be running
        for _, c in pairs(vim.lsp.get_clients()) do
          if c.name == "denols" and c.attached_buffers[bufnr] then
            c.stop()
          end
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

    -- Go Language Server
    vim.lsp.config.gopls = {
      cmd = { vim.fn.stdpath("data") .. "/mason/bin/gopls" },
      capabilities = capabilities,
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_markers = { "go.mod", "go.sum", ".git" },
      settings = {
        gopls = {
          staticcheck = true,
        },
      },
    }
  end
}
