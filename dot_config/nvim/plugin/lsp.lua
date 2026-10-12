vim.pack.add({
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig"
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    -- "cssls", "html", "lemminx", "ts_ls",
    -- "lua_ls", "pyright", "bashls", "jsonls", "yamlls", "taplo",
    -- "copilot"
  },
  automatic_enable = {
    "copilot"
  }
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function (event)
    -- "gra" (Normal and Visual mode) is mapped to |vim.lsp.buf.code_action()|
    -- "gri" is mapped to |vim.lsp.buf.implementation()|
    -- "grn" is mapped to |vim.lsp.buf.rename()|
    -- "grr" is mapped to |vim.lsp.buf.references()|
    -- "grt" is mapped to |vim.lsp.buf.type_definition()|
    -- "grx" is mapped to |vim.lsp.codelens.run()|
    -- "gO" is mapped to |vim.lsp.buf.document_symbol()|
    -- CTRL-S (Insert mode) is mapped to |vim.lsp.buf.signature_help()|

    local opts = { noremap = true, silent = true, buffer = event.buf }
    vim.keymap.set('n', ';r', vim.lsp.buf.references, opts)
    vim.keymap.set('n', ';n', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', ';a', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', ';i', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', ';f', function () vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('n', ';d', vim.diagnostic.setloclist, opts)

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
      vim.keymap.set(
        'i', '<C-f>',
        function ()
          if not vim.lsp.inline_completion.get() then return '<C-f>' end
        end,
        {
          buffer = event.buf,
          expr = true,
          replace_keycodes = true,
          desc = 'Get the current inline completion'
        }
      )
    end
  end
})

local servers = {
  pyright = {
    settings = {
      python = {
        formatting = {
          provider = 'yapf'
        }
      }
    }
  },
  rust_analyzer = {},
  clangd = {
    cmd = { 'clangd', '--clang-tidy' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' }
  },
  bashls = {},
  gopls = {
    settings = {
      gopls = {
        templateExtensions = { 'gotmpl' },
        gofumpt = true,
        analyses = {
          unusedparams = false
        }
      }
    },
    before_init = function (_, config)
      config.settings.gopls["local"] = vim.fn.trim(vim.fn.system("go list -m -f '{{.Path}}'"))
    end
  },
  emmylua_ls = {
    settings = {
      emmylua = {
        runtime = {
          version = 'LuaJIT'
        },
        diagnostics = {
          globals = { 'vim' }
        },
        workspace = {
          -- library = { vim.env.VIMRUNTIME }
          library = vim.api.nvim_get_runtime_file('', true)
        }
      }
    }
  },
  -- cssls = {},
  -- html = {},
  -- ts_ls = {},
  -- lemminx = {}, --xml
  -- neocmake = {},
  jsonls = {
    filetypes = { 'json', 'jsonc' }
  },
  yamlls = {
    filetypes = { 'yaml' }
  },
  taplo = {} -- toml
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

for server, config in pairs(servers) do
  vim.lsp.enable(server)
  vim.lsp.config(
    server,
    vim.tbl_deep_extend('force', {
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150
      }
    }, config
    )
  )
end
vim.env.SHELLCHECK_OPTS = '-e SC2086'
