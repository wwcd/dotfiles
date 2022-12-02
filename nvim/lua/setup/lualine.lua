local function paste_indicator()
  local indicator = ""

  if vim.o.paste == true then
    indicator = "PASTE"
  end

  return indicator
end

require('lualine').setup {
  options = {
    theme='landscape',
    -- theme = 'onedark',
    globalstatus = true,
    disabled_filetypes = {},
    icons_enabled = false,
    component_separators = { left = '', right = '|' },
    section_separators = { left = '', right = '' },
  },
  extensions = { 'quickfix', 'fzf', 'outline', 'nvimtree' },
  sections = {
    lualine_a = { 'mode', paste_indicator },
    lualine_b = { 'branch', 'diff', { "diagnostics", sources = { "nvim_diagnostic" } }, },
    lualine_c = { { 'filename', file_status = true, path = 1 } },
    lualine_x = { 'filetype', 'fileformat', 'encoding' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
}