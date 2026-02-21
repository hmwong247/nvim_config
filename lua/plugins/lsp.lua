return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"mason-org/mason.nvim",
			"hrsh7th/nvim-cmp",
			"ray-x/lsp_signature.nvim",
			"j-hui/fidget.nvim",
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
				},
			})

			-- ["sourcekit"] = function()
			-- 		require("sourcekit").sourcekit.setup({
			-- 			cmd = {
			-- 				"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
			-- 			},
			-- 		})
			-- end,
			-- }

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			})

			vim.lsp.config("omnisharp", {
				FormattingOptions = {
					EnableEditorConfigSupport = true,
					OrganizeImports = true,
				},
				MsBuild = {},
				RenameOptions = {},
				RoslynExtensionsOptions = {
					EnableDecompilationSupport = true,
					EnableAnalyzersSupport = true,
					EnableImportCompletion = true,
					AnalyzeOpenDocumentsOnly = false,
				},
				Sdk = {
					IncludePrereleases = true
				},
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>gd", require("omnisharp_extended").telescope_lsp_definition,
						{ noremap = true })
					vim.keymap.set("n", "<leader>gi", require("omnisharp_extended").telescope_lsp_implementation,
						{ noremap = true })
					vim.keymap.set("n", "<leader>gr", require("omnisharp_extended").telescope_lsp_references,
						{ noremap = true })
					vim.keymap.set("n", "<leader>go", require("omnisharp_extended").telescope_lsp_type_definition,
						{ noremap = true })
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			vim.diagnostic.config({
				update_in_insert = true,
				virtual_text = true,
			})

			require("fidget").setup({})

			require("lsp_signature").setup({})
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
