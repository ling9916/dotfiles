vim.g.mapleader = " "

local colorscheme = "tokyonight"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "config" },  -- import config
    { import = "plugins" },
  },
	installed = {
	colorscheme = colorscheme
	}
}

-- load colorscheme
if colorscheme then
  if not pcall(vim.cmd.colorscheme, colorscheme) then
    vim.notify(
      "Error setting up colorscheme: " .. colorscheme,
      vim.log.levels.ERROR
    )
  end
end
