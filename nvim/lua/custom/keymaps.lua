vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { desc = "Find current file" })

-- word wrap and keybinds mapping for soft lines
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true

-- Insert mode mappings

-- Normal mode mappings
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set("n", "<down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "<up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Visual mode mappings
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set("v", "<down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("v", "<up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Operator-pending mode mappings
vim.keymap.set("o", "j", "v:count == 0 ? 'gj' : <LeftMouse>'j'", { expr = true, silent = true })
vim.keymap.set("o", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set("o", "<down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("o", "<up", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Prevent deleting from also copying
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true })
vim.keymap.set({ "n", "v" }, "X", '"_X', { noremap = true })
-- buffers
vim.keymap.set("n", "<leader><right>", ":bn<cr>")
vim.keymap.set("n", "<leader><left>", ":bp<cr>")
vim.keymap.set("n", "<leader>w", ":bd<cr>")
-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- ctrl + backspace to delete word behind
vim.keymap.set({ "v", "i" }, "<C-BS>", "<C-W>")

vim.keymap.set("n", "<A-S-Left>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<A-S-Right>", "<C-w>v", { desc = "Split window to the right" })
vim.keymap.set("n", "<A-S-Down>", "<C-w>J", { desc = "Split window to the lower" })
vim.keymap.set("n", "<A-S-Up>", "<C-w>K", { desc = "Split window to the upper" })

vim.keymap.set("n", "<C-A-Left>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-A-Right>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-A-Down>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-A-Up>", "<C-w>K", { desc = "Move window to the upper" })

-- Resize vertical tabs
vim.keymap.set("n", "<A-;>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-'>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Jumps with ctrl + up/down

vim.keymap.set({ "n", "v" }, "<C-Up>", "<C-u>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-Down>", "<C-d>", { noremap = true, silent = true })
