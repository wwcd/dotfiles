-- Buffer
vim.keymap.set('n', '<leader>w', '<cmd>w!<cr>', { silent = true })
vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd<cr>', { silent = true })
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', { silent = true })
vim.keymap.set('n', '<leader>pp', '<cmd>setlocal paste!<cr>', { silent = true })
vim.keymap.set('n', '<leader><cr>', '<cmd>noh<cr>', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('n', 'Y', 'y$', { silent = true })
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<cr><cmd>pwd<cr>')

-- Tab
vim.keymap.set('', '<leader>te', '<cmd>tabnew<cr>')
vim.keymap.set('', '<leader>to', '<cmd>tabonly<cr>')
vim.keymap.set('', '<leader>tc', '<cmd>tabclose<cr>')
vim.keymap.set('', '<leader>tn', '<cmd>tabn<cr>')
vim.keymap.set('', '<leader>tp', '<cmd>tabp<cr>')

-- Loclist
vim.keymap.set('', '<leader>cc', '<cmd>botright copen<cr>')
vim.keymap.set('', '<leader>co', '<cmd>cclose<cr>')
vim.keymap.set('', '<leader>n', '<cmd>cn<cr>')
vim.keymap.set('', '<leader>p', '<cmd>cp<cr>')

-- Window movement
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Command movement
vim.keymap.set('c', '<c-a>', '<Home>')
vim.keymap.set('c', '<c-f>', '<Right>')
vim.keymap.set('c', '<c-b>', '<Left>')
vim.keymap.set('c', '<c-e>', '<End>')

-- Terminal switch
vim.keymap.set('t', '<Esc>', [[<c-\><c-n>]])
vim.keymap.set('t', '<a-h>', [[<c-\><c-n><c-w>h]])
vim.keymap.set('t', '<a-j>', [[<c-\><c-n><c-w>j]])
vim.keymap.set('t', '<a-k>', [[<c-\><c-n><c-w>k]])
vim.keymap.set('t', '<a-l>', [[<c-\><c-n><c-w>l]])
