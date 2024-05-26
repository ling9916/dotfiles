-- ============================================================================
--
-- ============================================================================
--
--
-- UTF-8
vim.g.encoding = "utf-8"

-- 使用相对行号
vim.opt.number = true         -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines

-- jkhl 移动时光标周围保留5行
vim.opt.scrolloff = 5     -- Number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 5 -- Number of columns to keep at the sides of the cursor

-- 设置缩进
vim.opt.expandtab = true -- Enable the use of space in tab
vim.opt.tabstop = 2      -- Number of space in a tab
vim.opt.shiftround = true
vim.opt.shiftwidth = 2   -- Number of space inserted for indentation

-- 补全增强
vim.opt.wildmenu = true
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Options for insert mode completion
vim.opt.pumheight = 15                                  -- Height of the pop up menu

return {}
