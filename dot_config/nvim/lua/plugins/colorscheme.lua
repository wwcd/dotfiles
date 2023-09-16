return {
  'navarasu/onedark.nvim',
  config = function()
    require('onedark').setup({
      transparent = true,
      highlights = {
        ["@text.uri"] = { fmt = 'none' },
        QuickFixLine = { fmt = 'none' }
      },
    })
    require('onedark').load()
  end
}
