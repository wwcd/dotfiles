local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<C-k>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-k>', { buffer = bufnr })
  vim.keymap.set('n', '<C-i>', api.node.show_info_popup, opts('Info'))
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
end

return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup({
      disable_netrw = true,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = true,
      renderer = {
        special_files = {},
        icons = {
          webdev_colors = false,
          symlink_arrow = ' -> ',
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = false,
          },
          glyphs = {
            default = '',
            symlink = '',
            bookmark = '',
            folder = {
              arrow_closed = '+',
              arrow_open = '-',
              default = '',
              open = '',
              empty = '',
              empty_open = '',
              symlink = '',
              symlink_open = '',
            },
          },
        },
      },
      git = {
        enable = false,
      },
      actions = {
        change_dir = {
          enable = false,
          restrict_above_cwd = false,
        },
      },
      filters = {
        dotfiles = true,
      },
      on_attach = on_attach,
    })

    local function toggle_replace()
      local view = require "nvim-tree.view"
      if view.is_visible() then
        view.close()
      end
      if vim.api.nvim_buf_get_name(0) == "" then
        vim.cmd(':edit %:p:h')
      else
        require "nvim-tree".open_replacing_current_buffer()
      end
    end

    vim.keymap.set('n', ';e', '<cmd>NvimTreeToggle<cr>')
    vim.keymap.set('n', '<F10>', '<cmd>NvimTreeToggle<cr>')
    vim.keymap.set('n', '<leader>e', function() toggle_replace() end, { silent = true })
  end
}
