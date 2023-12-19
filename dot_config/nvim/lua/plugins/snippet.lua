return {
  'l3mon4d3/luasnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'wwcd/nvim-snippets',
  },
  event = "InsertEnter",
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
    vim.keymap.set('i', '<Tab>', function()
      local ls = require('luasnip')
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
      end
    end, { silent = true })
  end
}
