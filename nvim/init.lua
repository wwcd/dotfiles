-- Leader
vim.g.mapleader = ','

-- Skip some remote provider loading
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Disable some built-in plugins we don't want
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Colorscheme
vim.cmd [[colorscheme desert]]
-- vim.o.termguicolors = true

-- Setting
vim.o.cmdheight = 2
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartindent = true
vim.o.laststatus = 2
vim.o.wrap = false
vim.o.shada = [[!,%,'300,<50,@100,h]]
vim.o.undofile = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.completeopt = [[noinsert,noselect,menuone]]
vim.o.listchars = [[tab:» ,eol:$,trail:~,extends:>,precedes:<,space:·]]
vim.o.showmode = false
vim.o.inccommand = 'split'
vim.o.mouse = ''

-- Buffer
vim.keymap.set('n', '<leader>w', '<cmd>w!<cr>', {silent=true})
vim.keymap.set('n', '<leader>e', '<cmd>edit %:p:h<cr>', {silent=true})
vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd<cr>', {silent=true})
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', {silent=true})
vim.keymap.set('n', '<leader>pp', '<cmd>setlocal paste!<cr>', {silent=true})
vim.keymap.set('n', '<leader><cr>', '<cmd>noh<cr>', {silent=true})
vim.keymap.set('v', '>', '>gv', {silent=true})
vim.keymap.set('v', '<', '<gv', {silent=true})
vim.keymap.set('n', 'Y', 'y$', {silent=true})
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

-- PACKER.NVIM
require('plugins')

-- FZF
vim.g.fzf_command_prefix = 'Fzf'
vim.g.fzf_preview_window = ''
vim.g.fzf_layout = { down='~40%' }
vim.keymap.set('n', '<c-p>', '<cmd>FzfFiles<cr>')
vim.keymap.set('n', '<c-b>', '<cmd>FzfBuffers<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>FzfBLines<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>FzfRg<cr>')
vim.keymap.set('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', {noremap=false})
vim.env.FZF_DEFAULT_COMMAND = 'fd --type file --follow --color never'
vim.env.FZF_DEFAULT_OPTS = '--color bg:-1,bg+:-1 --preview-window=0'

-- NERDTree
-- require('nvim-tree').setup({
--   disable_netrw = true,
--   hijack_netrw = true,
--   view = {
--   },
--   renderer = {
--     icons = {
--       show = { file = false, folder = false, folder_arrow = false, git = false },
--     }
--   },
-- })
-- vim.keymap.set('n', '<c-n>', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<c-n>', '<cmd>NERDTreeToggle<cr>')
vim.g.NERDTreeHighlightCursorline=0
vim.g.NERDTreeMinimalUI=1
vim.g.NERDTreeShowLineNumbers=1
vim.g.NERDTreeDirArrowExpandable='+'
vim.g.NERDTreeDirArrowCollapsible='-'
vim.g.NERDTreeStatusline=''


-- TAGBAR
vim.keymap.set('n', '<c-t>', '<cmd>Vista!!<cr>')
vim.keymap.set('n', '<c-g>', '<cmd>Vista finder fzf:nvim_lsp<cr>')
vim.g.vista_sidebar_position = 'vertical topleft'
vim.g.vista_default_executive = 'nvim_lsp'
vim.g.vista_disable_statusline = true
vim.g.vista_blink = {0, 0}
vim.g.vista_ignore_kinds = {'Field'}
vim.g.vista_icon_indent = {"", "  "}

-- Lualine
require('lualine').setup{
  options = {
    theme='landscape',
    globalstatus = false,
    disabled_filetypes={},
    icons_enabled=false,
    component_separators = { left = '', right = '|'},
    section_separators = { left = '', right = ''},
  },
  extensions={'quickfix', 'nerdtree_c', 'fzf', 'vista_c', 'nvim-tree_c'},
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', file_status=true, path=1}},
    lualine_x = {'filetype', 'fileformat', 'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  tabline = { }
}

-- LSP
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    underline = false,
  }
)
local lsp_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', ';f', function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set('n', ';r', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', ';ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', ';d', vim.diagnostic.setloclist, opts)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local servers = {
  pyright = { settings = { python = { formatting = { provider = 'yapf' } } } },
  rust_analyzer = {},
  clangd = {},
  bashls = {},
  gopls = {},
  cssls = {},
  html = {},
  tsserver = {},
  jsonls = {},
  yamlls = {},
  taplo = {},
  lemminx = {},
}
for server, config in pairs(servers) do
  nvim_lsp[server].setup(vim.tbl_deep_extend('force', {
    capabilities = capabilities,
    on_attach = lsp_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }, config))
end

-- AUTOPAIR
require("nvim-autopairs").setup({})

-- NVIM-GO
require('nvim-go').setup({})
vim.api.nvim_create_augroup('nvim-go', { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = 'nvim-go',
  pattern = { 'go' },
  callback = function()
    vim.keymap.set('n', '<leader>b', '<cmd>GoBuild<cr>', {buffer=true})
    vim.keymap.set('n', '<leader>r', '<cmd>GoRun<cr>', {buffer=true})
    vim.keymap.set('n', '<leader><tab>', '<cmd>GoIferr<cr>', {buffer=true})
  end,
})

-- NVIM-RUST
require('nvim-rust').setup({})
vim.api.nvim_create_augroup('nvim-rust', { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = 'nvim-rust',
  pattern = { 'rust' },
  callback = function()
    vim.keymap.set('n', '<leader>b', '<cmd>RustBuild<cr>', {buffer=true})
    vim.keymap.set('n', '<leader>r', '<cmd>RustRun<cr>', {buffer=true})
  end,
})

-- NVIM-ACK
require('nvim-ack').setup({})
vim.keymap.set('n', '<leader>gv', function() vim.fn.feedkeys(':Ack ' .. vim.fn.expand('<cword>') .. ' ') end, {silent=true})
vim.keymap.set('n', '<leader>ga', function() vim.fn.feedkeys(':Ack ') end, {silent=true})

-- TREE-SITTER
require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  ignore_install = { 'php', 'phpdoc' },
  highlight = { enable = true, },
  incremental_selection = { enable = true, },
  indent = { enable = true, },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  playground = {
    enable = true,
  }
})
