local function git_statusline()
  return 'GIT'
end

local function git_branch()
  return vim.fn.FugitiveHead()
end

local M = {}

M.sections = {
  lualine_a = { git_statusline },
  lualine_b = { git_branch },
  lualine_x = { 'filetype' },
  lualine_y = { 'progress' },
  lualine_z = { 'location' },
}

M.filetypes = { 'fugitive' }

return M
