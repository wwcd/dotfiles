return {
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ensure_installed = {
        "cpp",
        "rust",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "bash",
        "python",
        "nu",
        "proto",

        "toml",
        "json",
        "yaml",
        "xml",
        "diff",
        "dockerfile",
        "make",
        "cmake",

        "c",
        "markdown",
        "markdown_inline",
        "lua",
        "query",
        "vim",
        "vimdoc"
      }

      require('nvim-treesitter').install(ensure_installed)

      -- Ensure tree-sitter enabled after opening a file for target language
      local filetypes = {}
      for _, lang in ipairs(ensure_installed) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
          table.insert(filetypes, ft)
        end
      end
      local ts_start = function(ev) vim.treesitter.start(ev.buf) end

      -- WARN: Do not use "*" here - snacks.nvim is buggy and vim.notify triggers FileType events internally causing infinite callback loops
      vim.api.nvim_create_autocmd('FileType', {
        desc = 'Start treesitter',
        group = vim.api.nvim_create_augroup('start_treesitter', { clear = true }),
        pattern = filetypes,
        callback = ts_start,
      })
    end,
  },
  -- Textobjects
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    lazy = false,
    config = function()
      -- configuration
      require("nvim-treesitter-textobjects").setup {
        select = {
          lookahead = true,
          include_surrounding_whitespace = false,
        },
      }
      -- keymaps
      -- You can use the capture groups defined in `textobjects.scm`
      vim.keymap.set({ "x", "o" }, "af", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
      end)
      -- You can also use captures from other query groups like `locals.scm`
      vim.keymap.set({ "x", "o" }, "as", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
      end)
    end,
  },
}
