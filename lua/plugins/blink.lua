return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	event = "InsertEnter",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<cr>"] = { "select_and_accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
		},

		completion = {
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},
				},
			},
			documentation = { window = { border = "rounded" }, auto_show = true, auto_show_delay_ms = 0 },
		},
		cmdline = { enabled = false },
		signature = { enabled = false },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "snippets", "lsp", "buffer", "path" },
			per_filetype = {
				codecompanion = { "codecompanion" },
			},
		},
		fuzzy = { implementation = "rust" },
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.default" },
}
