-- NVIM-GO
require('nvim-go').setup({})
vim.api.nvim_create_augroup('nvim-go', { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = 'nvim-go',
  pattern = { 'go' },
  callback = function()
    vim.keymap.set('n', '<leader>b', '<cmd>GoBuild<cr>', { buffer = true })
    vim.keymap.set('n', '<leader>r', '<cmd>GoRun<cr>', { buffer = true })
    vim.keymap.set('n', '<leader><tab>', '<cmd>GoIferr<cr>', { buffer = true })
  end,
})
