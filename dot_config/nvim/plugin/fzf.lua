-- init
vim.g.fzf_command_prefix = 'Fzf'
vim.g.fzf_preview_window = ''
vim.g.fzf_layout = { down = '~30%' }
vim.env.FZF_DEFAULT_COMMAND = 'fd --type f --strip-cwd-prefix --follow'
vim.env.FZF_DEFAULT_OPTS = '--color bg:-1,bg+:-1 --style minimal --prompt="❯ " --gutter=" "'

-- https://github.com/junegunn/fzf.vim/commit/31e338e3143eddd6dbc424870899af28d987d30f#commitcomment-186153572
vim.g.fzf_vim = {
  buffers_options = '--no-header --info default'
}

vim.pack.add({
  "https://github.com/junegunn/fzf",
  "https://github.com/junegunn/fzf.vim"
})

-- config
vim.keymap.set('n', '<c-p>', '<cmd>FzfFiles<cr>')
vim.keymap.set('n', '<c-b>', '<cmd>FzfBuffers<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>FzfBLines<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>FzfRg<cr>')
vim.keymap.set('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', { noremap = false })
