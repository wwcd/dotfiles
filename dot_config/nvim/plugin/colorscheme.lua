vim.pack.add({ "https://github.com/navarasu/onedark.nvim" })

require('onedark').setup({
  transparent = true,
  highlights = {
    ["@text.uri"] = { fmt = 'none' },
    ["@string.special.url"] = { fmt = 'none' },
    QuickFixLine = { fmt = 'none' }
  },
})

require('onedark').load()
