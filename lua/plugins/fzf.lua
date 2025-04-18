return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
		{ "<leader>fg", "<cmd>FzfLua live_grep_glob<cr>", desc = "Grep" },
		{ "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
	},
	opts = {
		fzf_colors = {
			bg = { "bg", "Normal" },
			gutter = { "bg", "Normal" },
			info = { "fg", "Conditional" },
			scrollbar = { "bg", "Normal" },
			separator = { "fg", "Comment" },
		},
	},
}
