return {
  'stevearc/oil.nvim',
  opts = {},
  lazy = false,
  config = function()
    require("oil").setup({
      keymaps  = {
        ["<C-p>"] = false,
      }
    })
    vim.keymap.set('n', '<leader>e', '<cmd>Oil<cr>')
  end
}
