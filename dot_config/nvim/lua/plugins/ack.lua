return {
  'wwcd/nvim-ack',
  config = function()
    require('nvim-ack').setup({})
    vim.keymap.set('n', '<leader>gv',
      function()
        vim.fn.feedkeys(':Ack ' .. vim.fn.expand('<cword>') .. ' ')
      end,
      { silent = true })
    vim.keymap.set('v', 'gv',
      function()
        vim.fn.feedkeys(':Ack ' .. require('nvim-ack.utils').get_visual_selection() .. ' ', 'i')
      end,
      { silent = true })
    vim.keymap.set('n', '<leader>ga', function() vim.fn.feedkeys(':Ack ') end, { silent = true })
  end
}
