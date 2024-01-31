return {
  spec = {
    { import = "plugins" },
    -- user_plugins
  },
  defaults = { lazy = true },
  install = {
    missing = true,   -- install missing plugins on startup. This doesn't increase startup time.
  },
  performance = {
    rtp = {
      -- customize default disabled vim plugins
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
    },
  },
}

