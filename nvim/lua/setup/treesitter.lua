require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  highlight = { enable = true, },
  incremental_selection = { enable = true, },
  indent = { enable = true, },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  playground = {
    enable = true,
  }
})

require 'nvim-treesitter.parsers'.get_parser_configs().gotmpl = {
  install_info = {
    url = "https://github.com/wwcd/tree-sitter-go-template",
    files = { "src/parser.c" }
  },
  filetype = "gotmpl",
  used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl" }
}
