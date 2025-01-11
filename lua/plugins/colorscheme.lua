return {
	"navarasu/onedark.nvim",
	priority = 1000,
	opts = {},
	init = function()
		vim.cmd.colorscheme("onedark")
		vim.cmd([[highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl guisp=#f87171]])
	end,
}
