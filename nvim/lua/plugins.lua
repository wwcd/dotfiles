local ensure_packer = function()
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  -- Completion and linting and coding
  use { 'neovim/nvim-lspconfig' }
  use { 'liuchengxu/vista.vim' }
  use { 'gpanders/editorconfig.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'wwcd/nvim-ack' }
  use { 'wwcd/nvim-go', run = ':GoInstall', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'wwcd/nvim-rust', run = ':RustInstall' }

  -- Highlights and Color
  use { 'wwcd/desert' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', }
  use { 'nvim-treesitter/playground' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

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
  -- use { 'kyazdani42/nvim-tree.lua' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
