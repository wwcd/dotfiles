local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    -- "--branch=v9.6.0",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins",
  {
    -- defaults = { version = "v9.6.0" },
    change_detection = { enable = false, notify = false },
    checker = { enable = false, notify = false },
    ui = {
      icons = {
        cmd = "",
        config = "",
        event = "",
        ft = "",
        init = "",
        import = "",
        keys = "",
        lazy = "",
        loaded = "●",
        not_loaded = "○",
        plugin = "",
        runtime = "",
        require = "",
        source = "",
        start = "",
        task = "",
        list = {},
      }
    },
    performance = {
      rtp = {
        disabled_plugins = {
        -- "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        -- "tarPlugin",
        "tohtml",
        "tutor",
        -- "zipPlugin",
        }
      }
    },
    rocks = {
      enabled = false,
    }
  }
)
