return {
	{
		"reasonml-editor/vim-reason-plus",
	},
	{
		"ahrefs/vim-styled-ppx",
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ocamllsp = {
					filetypes = { "ocaml", "reason", "dune", "mlx", "re" },
					settings = {
						codelens = { enable = true },
						inlayHints = { enable = true },
						syntaxDocumentation = { enable = true },
					},
				},
			},
		},
	},
}
