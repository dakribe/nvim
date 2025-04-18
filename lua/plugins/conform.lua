return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			astro = { "prettier" },
			lua = { "stylua" },
			html = { "prettierd" },
			css = { "prettierd" },
			javascript = { "biome", "prettierd", stop_after_first = true },
			typescript = { "biome", "prettierd", stop_after_first = true },
			javascriptreact = { "biome", "prettierd", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", stop_after_first = true },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			mdx = { "prettierd" },
			rust = { "rustfmt" },
			tf = { "terraform_fmt" },
			sql = { "sql_formatter" },
			go = { "gofumpt", "goimports" },
			ocaml = { "ocamlformat" },
			reason = { "refmt" },
			python = { "ruff_format" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 5000,
			lsp_fallback = false,
		},
		formatters = {
			refmt = {
				command = "dune",
				args = { "@fmt", "--auto-promote" },
				stdin = false,
				exit_codes = { 0, 1 },
			},
		},
	},
}
