return {
	"ibhagwan/fzf-lua",
	config = function()
		local actions = require("fzf-lua.actions")
		local fzf = require("fzf-lua")
		require("fzf-lua").setup({
			actions = {
				files = {
					["enter"] = actions.file_edit,
					["ctrl-s"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
				},
			},
		})
		vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Fzf files" })
		vim.keymap.set("n", "<leader>fg", fzf.live_grep_glob, { desc = "Grep" })
		vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help" })
		vim.keymap.set("n", "<leader>fd", fzf.lsp_document_diagnostics, { desc = "Document Diagnostics" })
		vim.keymap.set("n", "<leader>f;", fzf.resume, { desc = "Resume" })
		vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "Recently Opened" })
	end,
}
