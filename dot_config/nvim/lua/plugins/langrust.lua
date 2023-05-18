return {
  'wwcd/nvim-rust',
  build = ':RustInstall',
  config = function()
    require('nvim-rust').setup({})
    vim.api.nvim_create_augroup('nvim-rust', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = 'nvim-rust',
      pattern = { 'rust' },
      callback = function()
        vim.keymap.set('n', '<leader>b', '<cmd>RustBuild<cr>', { buffer = true })
        vim.keymap.set('n', '<leader>r', '<cmd>RustRun<cr>', { buffer = true })
      end,
    })
  end
}
