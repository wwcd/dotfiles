return {
  'wwcd/aerial.nvim',
  config = function()
    require('aerial').setup({
      lazy_load = false,
      -- highlight_mode = 'none',
      highlight_on_jump = false,
      layout = {
        default_direction = 'left',
        min_width = 30,
      },
      keymaps = {
        ["<C-j>"] = false,
        ["<C-k>"] = false,
      }
    })

    vim.keymap.set('n', ';t', '<cmd>AerialToggle<cr>')
    vim.keymap.set('n', '<c-g>', '<cmd>call aerial#fzf()<cr>')
  end
}
