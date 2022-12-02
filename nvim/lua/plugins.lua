local ensure_packer = function()
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local get_setup = function(name)
  return string.format('require("setup/%s")', name)
end

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use { 'neovim/nvim-lspconfig', config = get_setup('lsp'), requires = {
    'nvim-lua/plenary.nvim',
    'jose-elias-alvarez/null-ls.nvim',
  } }

  -- EDIT
  use { 'gpanders/editorconfig.nvim' }
  use { 'windwp/nvim-autopairs', config = get_setup('autopairs') }

  -- Highlights and Color
  use { 'navarasu/onedark.nvim', config = get_setup('onedark') }
  use { 'nvim-lualine/lualine.nvim', config = get_setup('lualine') }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = get_setup('treesitter') }
  use { 'nvim-treesitter/playground' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  -- FZF
  use { 'junegunn/fzf', run = ':call fzf#install()' }
  use { 'junegunn/fzf.vim', config = get_setup('fzf') }

  -- WWCD
  use { 'wwcd/nvim-ack', config = get_setup('ack') }
  use { 'wwcd/nvim-go', run = ':GoInstall', config = get_setup('go') }
  use { 'wwcd/nvim-rust', run = ':RustInstall', config = get_setup('rust') }
  use { 'wwcd/aerial.nvim', config = get_setup('aerial') }

  -- TPOPE
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }

  -- NVIMTree
  use { 'kyazdani42/nvim-tree.lua', config = get_setup('nvimtree') }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
