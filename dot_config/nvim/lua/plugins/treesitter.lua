return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        ignore_install = { 'wgsl', 'wgsl_bevy', 'gleam', 'smali' },
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
      require 'nvim-treesitter.parsers'.get_parser_configs().gotmpl = {
        install_info = {
          url = 'https://github.com/wwcd/tree-sitter-go-template',
          branch = 'master',
          files = { 'src/parser.c' }
        },
        filetype = 'gotmpl',
        used_by = { 'gohtmltmpl', 'gotexttmpl', 'gotmpl' }
      }
      require 'nvim-treesitter.parsers'.get_parser_configs().jinja2 = {
        install_info = {
          url = 'https://github.com/theHamsta/tree-sitter-jinja2',
          branch = 'master',
          files = { 'src/parser.c' }
        },
        filetype = 'jinja2',
        used_by = { 'jinja2' }
      }
    end
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
}
