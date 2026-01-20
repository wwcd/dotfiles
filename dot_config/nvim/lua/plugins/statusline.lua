return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      theme = 'landscape',
      globalstatus = true,
      disabled_filetypes = {},
      icons_enabled = false,
      component_separators = { left = '', right = '|' },
      section_separators = { left = '', right = '' },
    },
    extensions = { 'quickfix', 'fzf', 'outline' },
    sections = {
      lualine_a = { { 'mode', fmt = function(mode) return vim.go.paste == true and mode .. ' PASTE' or mode end } },
      lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_diagnostic' } } },
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { { 'lsp_status', icon = '', symbols = { done = '' } }, 'filetype', 'fileformat', 'encoding' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  }
}
