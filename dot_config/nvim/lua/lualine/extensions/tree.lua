local function tree_current_dir()
  local ok, oil = pcall(require, 'oil')
  if ok then
    return vim.fn.fnamemodify(oil.get_current_dir(), ':~')
  else
    return ''
  end
end

local M = {}

M.sections = {
  lualine_a = { { 'mode', fmt = function(mode) return vim.go.paste == true and mode .. ' PASTE' or mode end } },
  lualine_c = { tree_current_dir },
  lualine_x = { 'filetype' },
  lualine_y = { 'progress' },
  lualine_z = { 'location' },
}

M.filetypes = { 'oil' }

return M
