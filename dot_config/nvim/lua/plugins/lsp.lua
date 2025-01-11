return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvimtools/none-ls.nvim',
    'williamboman/mason.nvim',
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = false,
        underline = false,
      }
    )


    local lsp_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
      -- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
      -- "grr" is mapped in Normal mode to vim.lsp.buf.references()
      -- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()

      vim.keymap.set('n', ';r', vim.lsp.buf.references, opts)
      vim.keymap.set('n', ';n', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', ';a', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', ';i', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', ';f', function() vim.lsp.buf.format({ async = true }) end, opts)
      vim.keymap.set('n', ';d', vim.diagnostic.setloclist, opts)

      vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
      vim.api.nvim_set_option_value('tagfunc', 'v:lua.vim.lsp.tagfunc', { buf = bufnr })
      vim.api.nvim_set_option_value('formatexpr', 'v:lua.vim.lsp.formatexpr()', { buf = bufnr })
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local lspconfig = require('lspconfig')
    local servers = {
      pyright = { settings = { python = { formatting = { provider = 'yapf' } } } },
      rust_analyzer = {},
      clangd = { cmd = { 'clangd', '--clang-tidy' } },
      bashls = { filetypes = { 'sh', 'zsh' } },
      gopls = {
        settings = {
          gopls = {
            templateExtensions = { 'gotmpl' },
            gofumpt = true,
            codelenses = {
              test = true,
              run_govulncheck = true,
              tidy = true,
              vendor = true,
              upgrade_dependency = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            }
          }
        }
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          }
        },
      },
      cssls = {},
      html = {},
      ts_ls = {},
      jsonls = {},
      yamlls = { settings = { yaml = { formatting = { provider = 'yamlfmt' } } } },
      taplo = {},
      lemminx = {},
    }
    for server, config in pairs(servers) do
      lspconfig[server].setup(vim.tbl_deep_extend('force', {
        capabilities = capabilities,
        on_attach = lsp_attach,
        flags = {
          debounce_text_changes = 150,
        }
      }, config))

      vim.env.SHELLCHECK_OPTS = '-e SC2086'
    end

    require('null-ls').setup({
      sources = {
        require('null-ls').builtins.formatting.shfmt,
        require('null-ls').builtins.formatting.yapf,
        require('null-ls').builtins.formatting.yamlfmt,
      }
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls", "pyright", "bashls", "cssls", "html", "jsonls", "yamlls", "taplo", "lemminx", "ts_ls", "bashls"
      },
    })
  end
}
