return {
  'williamboman/mason-lspconfig.nvim',
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "tsserver", "rust_analyzer" },
    }

    local opts = { noremap = true, silent = false }
    local function nkeymap(key, map)
      vim.api.nvim_set_keymap('n', key, map, opts)
    end
    local function ikeymap(key, map)
      vim.api.nvim_set_keymap('i', key, map, opts)
    end

    nkeymap(',gg', ':lua vim.lsp.buf.definition()<cr>')
    nkeymap(',gd', ':lua vim.lsp.buf.definition()<cr>')
    nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
    nkeymap(',gt', ':lua vim.lsp.buf.type_definition()<cr>')
    nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
    nkeymap(',gD', ':lua vim.lsp.buf.declaration()<cr>')
    nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
    nkeymap(',gi', ':lua vim.lsp.buf.implementation()<cr>')
    nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
    nkeymap(',gw', ':lua vim.lsp.buf.document_symbol()<cr>')
    nkeymap(',gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
    nkeymap(',gr', ':lua vim.lsp.buf.references()<cr>')
    nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
    nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
    ikeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
    nkeymap('<leader>ca', ':lua vim.lsp.buf.code_action()<cr>')
    nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
    nkeymap('<leader>en', ':lua vim.diagnostic.goto_next()<cr>')
    nkeymap('<leader>eN', ':lua vim.diagnostic.goto_prev()<cr>')
    nkeymap('<leader>eN', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    nkeymap('<leader>en', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    nkeymap('<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>')
    nkeymap(',ff', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
  end
}
