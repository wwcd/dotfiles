return {
  'wwcd/nvim-ack',
  event = "VeryLazy",
  config = function()
    require('nvim-ack').setup({})
    vim.keymap.set('n', '<leader>gv',
      function() vim.api.nvim_feedkeys(':Ack ' .. vim.fn.expand('<cword>') .. ' ', 'n', false) end,
      { silent = true }
    )
    vim.keymap.set('v', 'gv',
      function()
        local selection = require('nvim-ack.utils').get_visual_selection()

        -- exit visule mode
        local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
        vim.api.nvim_feedkeys(esc, 'n', false)

        vim.api.nvim_feedkeys(':Ack ' .. string.format("%q", selection), 'n', false)
      end,
      { silent = true }
    )
    vim.keymap.set('n', '<leader>ga',
      function() vim.api.nvim_feedkeys(':Ack ', 'n', false) end,
      { silent = true }
    )
  end
}
