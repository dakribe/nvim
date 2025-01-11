return {
	"echasnovski/mini.icons",
	version = false,
	config = function()
		require("mini.icons").setup({
			extension = {
				re = { hl = "MiniIconsRed", glyph = "" },
			},
			file = {
				[".ocamlformat"] = { glyph = "", hl = "MiniIconsGrey" },
			},
		})
		MiniIcons.mock_nvim_web_devicons()
	end,
}
