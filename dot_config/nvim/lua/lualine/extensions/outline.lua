-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local function outline_statusline()
  return 'OUTLINE'
end

local M = {}

M.sections = {
  lualine_a = { outline_statusline },
}

M.filetypes = { 'aerial' }

return M
