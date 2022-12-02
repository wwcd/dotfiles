-- Copyright (c) 2020-2021
-- MIT license, see LICENSE for more details.
-- Credit: wsl(lightline)
-- stylua: ignore
local colors = {
  white      = '#ffffff',
  lightwhite = '#e0e0e0',
  red        = '#af0000',
  blue       = '#0000cd',
  lightblue  = '#5f00ff',
  gray       = '#5c6370',
  darkgray   = '#31353f',
  lightgreen = '#005f00',
}

return {
  normal = {
    a = { fg = colors.blue, bg = colors.white, gui = 'bold' },
    b = { fg = colors.white, bg = colors.blue },
    c = { fg = colors.gray, bg = colors.darkgray },
    y = { fg = colors.darkgray, bg = colors.gray },
    z = { fg = colors.darkgray, bg = colors.lightwhite },
  },
  insert = {
    a = { fg = colors.lightgreen, bg = colors.white, gui = 'bold' },
    b = { fg = colors.white, bg = colors.lightgreen },
    y = { fg = colors.darkgray, bg = colors.gray },
    z = { fg = colors.darkgray, bg = colors.lightwhite },
  },
  visual = {
    a = { fg = colors.lightblue, bg = colors.white, gui = 'bold' },
    b = { fg = colors.white, bg = colors.lightblue },
    y = { fg = colors.darkgray, bg = colors.gray },
    z = { fg = colors.darkgray, bg = colors.lightwhite },
  },
  replace = {
    a = { fg = colors.red, bg = colors.white, gui = 'bold' },
    b = { fg = colors.white, bg = colors.red },
    y = { fg = colors.darkgray, bg = colors.gray },
    z = { fg = colors.darkgray, bg = colors.lightwhite },
  },
  inactive = {
  },
}
