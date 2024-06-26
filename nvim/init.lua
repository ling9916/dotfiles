-- ============================================================================
--
-- ============================================================================
--
vim.g.mapleader = " "


local colorscheme = "tokyonight"

-- ===================================================================
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local isErr = vim.fn.system {
    "git", "clone",
    "--filte=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  }
  if vim.api.nvim_get_vvar "shell_error" ~= 0 then
    vim.api.nvim_err_writeln("Error cloning lazy.nvim repository...\n\n" .. isErr)
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

require("config.autocmds")
require('config.options')
require('config.keymaps')
