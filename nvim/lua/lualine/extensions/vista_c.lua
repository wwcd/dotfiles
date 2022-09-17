-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local function vista_statusline()
  return 'TAGLIST'
end

local M = {}

M.sections = {
  lualine_a = { vista_statusline },
}

M.filetypes = { 'vista_kind' }

return M
