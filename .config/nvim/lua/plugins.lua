local packer = nil

local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init { disable_commands = true }
  end

  local use = packer.use
  packer.reset()

  use { 'wbthomason/packer.nvim', opt=true}

  -- Completion and linting and coding
  use { 'neovim/nvim-lspconfig' }

  use { 'wellle/targets.vim' }
  use { 'liuchengxu/vista.vim' }
  use { 'editorconfig/editorconfig-vim' }
  use { '~/github/wwcd/nvim-go', run = ':GoInstall' }
  use { '~/github/wwcd/nvim-ack' }

  -- Highlights and Color
  use { '~/github/wwcd/desert' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', }

  -- FZF
  use { 'junegunn/fzf', dir = '~/.fzf', run = ':call fzf#install()' }
  use { 'junegunn/fzf.vim'}

  -- TPOPE
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }

  -- NERDTree
  use { 'preservim/nerdtree' }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
