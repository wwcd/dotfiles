return {
  -- LSP Config
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          -- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
          -- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
          -- "grr" is mapped in Normal mode to vim.lsp.buf.references()
          -- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()

          local opts = { noremap = true, silent = true, buffer = event.buf }
          vim.keymap.set('n', ';r', vim.lsp.buf.references, opts)
          vim.keymap.set('n', ';n', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', ';a', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', ';i', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          -- vim.keymap.set('i', '<c-s>', vim.lsp.buf.signature_help, opts)
          -- vim.keymap.set('n', '<c-s>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', ';f', function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set('n', ';d', vim.diagnostic.setloclist, opts)

          vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = event.buf })
          vim.api.nvim_set_option_value('tagfunc', 'v:lua.vim.lsp.tagfunc', { buf = event.buf })
          vim.api.nvim_set_option_value('formatexpr', 'v:lua.vim.lsp.formatexpr()', { buf = event.buf })

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client == nil then
            return
          end

          if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
          end

          -- if client:supports_method('textDocument/formatting') then
          --   vim.api.nvim_create_autocmd('BufWritePre', {
          --     buffer = event.buf,
          --     callback = function()
          --       vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
          --     end,
          --   })
          -- end

          -- inline completion, only work after neovim commit 58060c2340a52377a0e1d2b782ce1deef13b2b9b
          if client:supports_method('textDocument/inlineCompletion') and vim.lsp.inline_completion then
            vim.lsp.inline_completion.enable(true)
            vim.keymap.set('i', '<C-f>',
              function()
                if not vim.lsp.inline_completion.get() then return '<C-f>' end
              end,
              {
                expr = true,
                replace_keycodes = true,
                desc = 'Get the current inline completion',
              }
            )
          end
        end
      })

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
                generate = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                unusedparams = false,
              },
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
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            }
          },
        },
        -- cssls = {},
        -- html = {},
        -- ts_ls = {},
        jsonls = {},
        yamlls = { settings = { yaml = { formatting = { provider = 'yamlfmt' } } } },
        taplo = {}, --toml
        -- lemminx = {}, --xml
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

      for server, config in pairs(servers) do
        vim.lsp.enable(server)
        vim.lsp.config(server, vim.tbl_deep_extend('force', {
          capabilities = capabilities,
          flags = {
            debounce_text_changes = 150,
          }
        }, config))
      end
      vim.env.SHELLCHECK_OPTS = '-e SC2086'
    end
  },

  -- Null-ls for formatters and linters
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('null-ls').setup({
        sources = {
          require('null-ls').builtins.formatting.shfmt,
          require('null-ls').builtins.formatting.yapf,
          require('null-ls').builtins.formatting.yamlfmt,
        }
      })
    end
  },

  -- Mason and Mason LSPConfig
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      'mason-org/mason.nvim',
    },
    config = function()
      require("mason").setup({
        ensure_installed = {
          "yapf", "shfmt", "yamlfmt",
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- "cssls", "html", "lemminx", "ts_ls",
          "lua_ls", "pyright", "bashls", "jsonls", "yamlls", "taplo",
          "copilot"
        },
        automatic_enable = {
          "copilot",
        }
      })
    end
  }
}
