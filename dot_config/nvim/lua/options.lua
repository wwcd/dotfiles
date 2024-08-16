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

-- Setting
vim.opt.cmdheight = 2
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.wrap = false
vim.opt.shada = [[!,%,'300,<100,@1000,h]]
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.completeopt = [[noinsert,noselect,menuone]]
vim.opt.listchars = [[tab:» ,eol:$,trail:~,extends:>,precedes:<,space:·]]
vim.opt.showmode = false
vim.opt.mouse = ''
vim.opt.inccommand = 'split'
vim.opt.splitkeep = 'screen'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.diffopt:append('linematch:60')
vim.opt.diffopt:append('iwhite')

-- Enable lua cache
vim.loader.enable()
