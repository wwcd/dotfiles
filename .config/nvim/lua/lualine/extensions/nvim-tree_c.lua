-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local function nvimtree_statusline()
  return 'LUATREE'
end

local M = {}

M.sections = {
  lualine_a = { nvimtree_statusline },
}

M.filetypes = { 'NvimTree' }

return M
