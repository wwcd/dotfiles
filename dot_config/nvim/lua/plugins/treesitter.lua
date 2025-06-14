return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup({
        ensure_installed = {
          -- 'bash',
          -- 'c',
          'cmake',
          'cpp',
          'css',
          'csv',
          'diff',
          'dockerfile',
          'go',
          'gomod',
          'gosum',
          'gotmpl',
          'gowork',
          'groovy',
          'helm',
          'html',
          'ini',
          'javascript',
          'json',
          'jsonc',
          'jinja',
          'jinja_inline',
          -- 'lua',
          'luadoc',
          'make',
          -- 'markdown',
          -- 'markdown_inline',
          -- 'python',
          -- 'query',
          'regex',
          'rust',
          'sql',
          'toml',
          'typescript',
          -- 'vim',
          -- 'vimdoc',
          'xml',
          'yaml',
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        modules = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = { enable = true, },
        indent = { enable = false, },
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
        },
        playground = {
          enable = true,
        }
      })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = "VeryLazy",
  },
}
