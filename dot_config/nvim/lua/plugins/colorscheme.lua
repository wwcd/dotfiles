return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('onedark').setup({
      transparent = true,
      highlights = {
        ["@text.uri"] = { fmt = 'none' },
        ["@string.special.url"] = { fmt = 'none' },
        QuickFixLine = { fmt = 'none' }
      },
    })
    require('onedark').load()
  end
}
