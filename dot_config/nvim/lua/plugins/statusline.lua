local function paste_indicator()
  local indicator = ''
  if vim.o.paste == true then
    indicator = 'PASTE'
  end
  return indicator
end

local function lsp_status()
  local message = vim.lsp.status()
  message = message:gsub("^([^,]+).*", "%1")
  return message:sub(0, 48)
end

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      theme = 'landscape',
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
      lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_diagnostic' } }},
      lualine_c = { { 'filename', file_status = true, path = 1 } },
      lualine_x = { lsp_status, 'filetype', 'fileformat', 'encoding' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  }
}
