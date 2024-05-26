local keymap = vim.keymap.set

keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })

-- Split windows
keymap("n", "|",  "<cmd>vsplit<cr>", { desc = "Vertical Split" })
keymap("n", "\\", "<cmd>split<cr>", { desc = "Horizontal Split" })
keymap("n", "vs", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
keymap("n", "sp", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Navigation windows
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Window Size Adjusting
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- Navigate tabs
keymap("n", "]t", function() vim.cmd.tabnext() end, { desc = "Next tab" })
keymap("n", "[t", function() vim.cmd.tabprevious() end, { desc = "Previous tab" })

keymap("n", "<Leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Explorer" })
keymap("n", "<Leader>o", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd "p"
  else
    vim.cmd.Neotree "focus"
  end
end, { desc = "Toggle Explorer Focus" })

-- Don't delete this line
return {}
