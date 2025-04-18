---@type vim.lsp.Config
return {
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "menhir", "ocamlinterface", "ocamllex", "reason", "dune", "mlx" },
	root_markers = { "*.opam", ".git", "dune-project", "dune-workspace" },
	settings = {
		codelens = { enable = true },
		inlayHints = { enable = true },
		syntaxDocumentation = { enable = true },
	},
}
