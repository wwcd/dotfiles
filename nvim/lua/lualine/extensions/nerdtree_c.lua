-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local function nerdtree_statusline()
  return 'NERDTREE'
end

local M = {}

M.sections = {
  lualine_a = { nerdtree_statusline },
}

M.filetypes = { 'nerdtree' }

return M
