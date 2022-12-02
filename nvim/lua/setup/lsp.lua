vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = false,
  underline = false,
}
)
local lsp_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', ';f', function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set('n', ';r', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', ';a', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', ';d', vim.diagnostic.setloclist, opts)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  -- vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local servers = {
  pyright = { settings = { python = { formatting = { provider = 'yapf' } } } },
  rust_analyzer = {},
  clangd = {},
  bashls = { filetypes = { 'sh', 'zsh' } },
  gopls = { settings = { gopls = { templateExtensions = { 'gotmpl' }, gofumpt = true } } },
  cssls = {},
  html = {},
  tsserver = {},
  jsonls = {},
  yamlls = { settings = { yaml = { formmtting = { provider = 'yamlfmt' } } } },
  taplo = {},
  lemminx = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
        workspace = {
          library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true, },
        },
        format = {
          defaultConfig = {
            max_line_length = "200"
          }
        }
      }
    },
  }
}
for server, config in pairs(servers) do
  nvim_lsp[server].setup(vim.tbl_deep_extend('force', {
    capabilities = capabilities,
    on_attach = lsp_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }, config))
end

require('null-ls').setup({ sources = {
  require('null-ls').builtins.formatting.yapf,
  require('null-ls').builtins.formatting.shfmt,
  require('null-ls').builtins.formatting.yamlfmt,
} })
