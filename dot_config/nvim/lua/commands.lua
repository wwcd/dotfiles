-- :h last-position-jump
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Update packages
vim.api.nvim_create_user_command("PackUpdate", function(info)
  if #info.fargs ~= 0 then
    vim.pack.update(info.fargs, { force = info.bang })
  else
    vim.notify("Updating everything.", vim.log.levels.INFO)
    vim.pack.update(nil, { force = info.bang })
  end
end, {
  desc = "Update packages",
  nargs = "*",
  bang = true,
})
