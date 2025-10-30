vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>tt", "<cmd>Neotree left toggle<cr>", { desc = "Toggle NeoTree" })
vim.keymap.set("n", "<leader>buf", "<cmd>Neotree buffers<cr>", { desc = "Neotree buffer view" })
-- vim.keymap.set("n", "<leader>git", "<cmd>Neotree git_status<cr>", { desc = "Neotree git view" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>dv[", "<cmd>DiffviewOpen<cr>", { desc = "DiffviewOpen" })
vim.keymap.set("n", "<leader>dv]", "<cmd>DiffviewClose<cr>", { desc = "DiffviewClose" })
vim.keymap.set("n", "<leader>dvh", "<cmd>DiffviewFileHistory<cr>", { desc = "DiffviewFileHistory" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- switch to alternate file
vim.keymap.set("n", "<leader>a", "<cmd>e #<CR>", { desc = "" })
