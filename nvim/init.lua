-- ============================================================================
--
-- ============================================================================
--
vim.g.mapleader = " "


local colorscheme = "everforest"


-- ===================================================================
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local output = vim.fn.system { "git", "clone", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath }
  if vim.api.nvim_get_vvar "shell_error" ~= 0 then
    vim.api.nvim_err_writeln("Error cloning lazy.nvim repository...\n\n" .. output)
  end
  local oldcmdheight = vim.opt.cmdheight:get()
  vim.opt.cmdheight = 1
  vim.notify "Please wait while plugins are installed..."
  vim.opt.cmdheight = oldcmdheight
end
vim.opt.rtp:prepend(lazypath)

-- load the configuration of lazy.nvim
require("lazy").setup(vim.tbl_deep_extend("force", require("config.lazy"), { installed = { colorscheme = colorscheme } }))

-- load colorscheme
if colorscheme then
  if not pcall(vim.cmd.colorscheme, colorscheme) then
    vim.notify(
      "Error setting up colorscheme: " .. colorscheme,
      vim.log.levels.ERROR
    )
  end
end

require("config.autocmd")
require('config.basic')
require('config.keymaps')
