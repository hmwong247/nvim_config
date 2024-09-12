return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
			"hrsh7th/nvim-cmp",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				}
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
				},

				-- NOTE: default handlers for servers setup
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup {}
					end,
					["sourcekit"] = function()
						require("sourcekit_lsp").setup({
							cmd = {
								"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
							},
						})
					end,
				}
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				completion = { completopt = "menu,menuone,noinsert" },
				sources = {
					{ name = "nvim_lsp" },
				},
				snippet = {
					expand = function(args)
						-- You need Neovim v0.10 to use vim.snippet
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),
			})
		end,
	},
}
