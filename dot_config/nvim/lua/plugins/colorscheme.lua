return {
  'navarasu/onedark.nvim',
  config = function()
    require('onedark').setup({
      transparent = true,
      highlights = {
        QuickFixLine = { fmt = 'none' }
      },
    })
    require('onedark').load()
  end
}
