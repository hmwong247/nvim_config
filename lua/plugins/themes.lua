-- Themes
local themes = {}
themes.tokyonight_night = {
	"folke/tokyonight.nvim",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("tokyonight-night")
		vim.cmd.hi("Comment gui=none")
	end,
}

themes.rose_pine = {
	"rose-pine/neovim",
	--	variant = "moon",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("rose-pine")
	end,
}

return {
	themes.rose_pine,
}
