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


-- wave the default heart-warming theme,
-- dragon for those late-night sessions
-- lotus for when you're out in the open.
themes.kanagawa = {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("kanagawa-dragon")
	end,
}

return {
	themes.kanagawa,
}
