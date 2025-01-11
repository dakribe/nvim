return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	keys = {
		{
			"<leader>cg",
			function()
				local grug = require("grug-far")
				grug.open({
					transient = true,
					keymaps = { help = "?" },
				})
			end,
			desc = "Search and Replace",
			mode = { "n", "v" },
		},
	},
	opts = {
		startInInsertMode = false,
	},
}
