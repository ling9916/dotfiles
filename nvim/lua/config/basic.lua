-- ============================================================================
--
-- ============================================================================
--
-- UTF-8
vim.g.encoding = "utf-8"

-- file options
vim.opt.backup = false      -- creates a backup file
vim.opt.swapfile = false    -- creates a swapfileunicode
vim.opt.writebackup = false -- Disable making a backup before overwriting a file
vim.opt.autoread = true     -- 当文件被外部程序修改时，自动加载
vim.opt.autochdir = true    -- 自动切换工作目录
vim.opt.undofile = true     -- enable persistent undo
vim.opt.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')


vim.opt.exrc = true
vim.opt.fillchars = { eob = " " } -- Disable `~` on nonexistent lines
vim.opt.title = true

-- jkhl 移动时光标周围保留5行
vim.opt.scrolloff = 5     -- Number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 5 -- Number of columns to keep at the sides of the cursor

-- 使用相对行号
vim.opt.number = true         -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines

-- 高亮所在行
vim.opt.cursorline = true -- Highlight the text line of the cursor

-- 显示左侧图标指示列
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.numberwidth = 2    -- set number column width to 2 {default 4}

-- 右侧参考线，超过表示代码过长，考虑换行
vim.wo.colorcolumn = "120"

-- 设置缩进
vim.opt.tabstop = 2      -- Number of space in a tab
vim.opt.shiftround = true
vim.opt.shiftwidth = 2   -- Number of space inserted for indentation

vim.opt.expandtab = true -- Enable the use of space in tab

-- 新行对齐当前行
vim.opt.autoindent = true
vim.opt.smartindent = true -- Smarter autoindentation

-- 搜索大小写不敏感，除非包含大写
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true  -- Case sensitivie searching

-- 搜索时不高亮
-- vim.opt.hlsearch = true          -- highlight all matches on previous search pattern

-- 禁止折行
vim.opt.wrap = false -- Disable wrapping of lines longer than the width of window

-- 光标在行首尾时<Lift> <Right>可以跳到下一行
vim.opt.whichwrap = '<,>,[,]'

-- 允许隐藏被修改过的buffer
vim.opt.hidden = true

-- 鼠标支持
vim.opt.mouse = "a" -- allow the mouse to be used in neovim

-- smaller updatetime
vim.opt.updatetime = 100 -- Length of time to wait before triggering the plugin
vim.opt.timeoutlen = 500 -- Shorten key timeout length a little bit for which-key

-- split window 从下边和右边出现
vim.opt.splitbelow = true -- Splitting a new window below the current one
vim.opt.splitright = true -- Splitting a new window at the right of the current one

-- 样式
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.opt.background = "dark"
vim.opt.showmode = false     -- Disable showing modes in command line
vim.opt.cmdheight = 0        -- hide command line unless needed

-- 不可见字符的显示，这里只把空格显示为一个点
vim.opt.list = true
-- vim.o.listchars = "space:·"

-- 补全增强
vim.opt.wildmenu = true
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Options for insert mode completion
vim.opt.pumheight = 15                                  -- Height of the pop up menu

-- Dont' pass messages to |ins-completin menu|
vim.opt.shortmess:append "c"

-- 永远显示 tabline
vim.opt.showtabline = 3       -- always show tabs
vim.opt.laststatus = 3        -- globalstatu

vim.opt.virtualedit = "block" -- allow going past end of line in visual block mode
vim.opt.conceallevel = 0      -- so that `` is visible in markdown files



-- 其他
vim.opt.breakindent = true                                         -- Wrap indent to match  line start
vim.opt.copyindent = true                                          -- Copy the previous indentation on autoindenting
vim.opt.foldenable = true                                          -- enable fold for nvim-ufo
vim.opt.foldlevel = 99                                             -- set high foldlevel for nvim-ufo
vim.opt.foldlevelstart = 99                                        -- start with all code unfolded
vim.opt.foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil     -- show foldcolumn in nvim 0.9
vim.opt.history = 100                                              -- Number of commands to remember in a history table
vim.opt.infercase = true                                           -- Infer cases in keyword completion
vim.opt.linebreak = true                                           -- Wrap lines at 'breakat'
vim.opt.preserveindent = true                                      -- Preserve indent structure as much as possible
vim.opt.splitkeep = vim.fn.has "nvim-0.9" == 1 and "screen" or nil -- Maintain code view when splitting
vim.opt.viewoptions:remove "curdir"                                -- disable saving current directory with views
vim.opt.shortmess:append { s = true, I = true }                    -- disable startup message
vim.opt.backspace:append { "nostop" }                              -- Don't stop backspace at insert
if vim.fn.has "nvim-0.9" == 1 then
  vim.opt.diffopt:append "linematch:60"                            -- enable linematch diff algorithm
end


-- Connection to the system clipboard
if vim.fn.has "macunix" then
  vim.opt.clipboard:append { 'unnamedplus' }
end
if vim.fn.has "win32" then
  vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end

if vim.fn.has "wsl" then
  vim.cmd [[
    augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe',@")
    augroup END
  ]]
end
