return {
  "rcarriga/nvim-notify",
  init = function()
    local plugin = "nvim-notify"
    local func_names = "notify"
    local module = vim

    if type(func_names) == "string" then func_names = { func_names } end
    for _, func in ipairs(func_names) do
      local old_func = module[func]
      module[func] = function(...)
        module[func] = old_func
        require("lazy").load { plugins = { plugin } }
        module[func](...)
      end
    end
  end,
  opts = {
    background_colour = "#00000000",
    on_open = function(win) vim.api.nvim_win_set_config(win, { zindex = 1000 }) end
  },

  config = function(_, opts)
    local notify = require "notify"
    notify.setup(opts)
    vim.notify = notify
  end,

}

