-- vim.keymap.set('n', '<c-n>', '<cmd>NERDTreeToggle<cr>')
-- vim.g.NERDTreeHighlightCursorline = 0
-- vim.g.NERDTreeMinimalUI = 1
-- vim.g.NERDTreeShowLineNumbers = 1
-- vim.g.NERDTreeShowRelativeLineNumbers = 1
-- vim.g.NERDTreeDirArrowExpandable = '+'
-- vim.g.NERDTreeDirArrowCollapsible = '-'
-- vim.g.NERDTreeStatusline = ''

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  renderer = {
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
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "+",
          arrow_open = "-",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
  view = {
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  git = {
    enable = false,
  },
  actions = {
    change_dir = {
      enable = false,
    },
  },
  filters = {
    dotfiles = true,
  }
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

vim.keymap.set('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>e', function() toggle_replace() end, { silent = true })
