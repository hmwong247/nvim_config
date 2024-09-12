-- NOTE: optional config
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("UiEnter", {
	desc = "Open Neotree automatically",
	group = "neotree",
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("Neotree toggle")
		end
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-autocmd', { clear = true }),
	callback = function(event)
		local ts_builtin = require("telescope.builtin")
		local opts = { buffer = event.bufnr }

		vim.keymap.set("n", "K", ts_builtin.lsp_definitions, opts)
		vim.keymap.set("n", "<leader>F", ts_builtin.lsp_references, opts)
		vim.keymap.set("n", "gi", ts_builtin.lsp_implementations, opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	end
})
