return {
  'junegunn/fzf.vim',
  dependencies = { 'junegunn/fzf', build = ':call fzf#install()' },
  init = function()
    vim.g.fzf_command_prefix = 'Fzf'
    vim.g.fzf_preview_window = ''
    vim.g.fzf_layout = { down = '~30%' }
    vim.keymap.set('n', '<c-p>', '<cmd>FzfFiles<cr>')
    vim.keymap.set('n', '<c-b>', '<cmd>FzfBuffers<cr>')
    vim.keymap.set('n', '<leader>fb', '<cmd>FzfBLines<cr>')
    vim.keymap.set('n', '<leader>ff', '<cmd>FzfRg<cr>')
    vim.keymap.set('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', { noremap = false })
    vim.env.FZF_DEFAULT_COMMAND = 'fd --type f --strip-cwd-prefix --follow'
    vim.env.FZF_DEFAULT_OPTS = '--color bg:-1,bg+:-1 --preview-window=0 --no-separator --prompt="❯ " --pointer=">"'
  end
}
