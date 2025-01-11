local common = {
	inlayHints = {
		enumMemberValues = { enabled = true },
		functionLikeReturnTypes = { enabled = true },
		parameterNames = { enabled = "literals" },
		parameterTypes = { enabled = true },
		propertyDeclarationTypes = { enabled = true },
		variableTypes = { enabled = false },
	},
	suggest = {
		completeFunctionCalls = true,
	},
	updateImportsOnFileMove = { enabled = "always" },
}

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				html = {},
				cssls = {},
				biome = {},
				jsonls = {},
				tailwindcss = {},
				vtsls = {
					settings = {
						complete_function_calls = true,
						javascript = common,
						typescript = common,
						vtsls = {
							autoUseWorkspaceTsdk = true,
							enableMoveToFileCodeAction = true,
							experimental = {
								completion = {
									enableServerSideFuzzyMatch = true,
								},
								maxInlayHintLength = 30,
							},
						},
					},
					single_file_support = true,
				},
			},
		},
	},
}
