vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	float = {
		border = "rounded",
	},
})

local signs = { Error = "󰚌 ", Warn = " ", Hint = "󱧡 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local function map(key, command, opts)
			local mode = opts.mode or "n"
			opts.mode = nil
			opts.buffer = ev.buf
			vim.keymap.set(mode, key, command, opts)
		end

		map("gd", function()
			vim.lsp.buf.definition()
		end, { desc = "Goto definition" })
		map("gr", "<cmd>FzfLua lsp_references<CR>", { desc = "References" })
		map("K", function()
			vim.lsp.buf.hover()
		end, { desc = "Hover" })
		map("<leader>vd", function()
			vim.diagnostic.open_float()
		end, { desc = "diagnostic float" })
		map("<leader>ca", function()
			vim.lsp.buf.code_action()
		end, { desc = "Code actions" })
		map("<leader>rn", function()
			vim.lsp.buf.rename()
		end, { desc = "Rename" })
		map("<leader>ws", function()
			vim.lsp.buf.workspace_symbol()
		end, { desc = "Workplace symbol" })
		map("<leader>cL", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
		map("[d", function()
			vim.diagnostic.goto_next()
		end, { desc = "Next diagnostic" })
		map("]d", function()
			vim.diagnostic.goto_prev()
		end, { desc = "Previous diagnostic" })
		map("<leader>rr", function()
			vim.lsp.buf.references()
		end, { desc = "References" })
	end,
})

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
		dependencies = {
			"saghen/blink.cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			servers = {
				clangd = {},
				marksman = {},
				sqlls = {},
				prismals = {},
				jedi_language_server = {},
				dockerls = {},
				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = true,
								url = "https://www.schemastore.org/api/json/catalog.json",
							},
							schemas = {
								kubernetes = "*.yaml",
								["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
								["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
								["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
							},
							format = { enabled = true },
							validate = true,
							completion = true,
							hover = true,
						},
					},
				},
				terraformls = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			-- Setup mason so it can manage 3rd party LSP servers
			require("mason").setup({})

			-- Configure mason to auto install servers
			require("mason-lspconfig").setup({})

			local md_namespace = vim.api.nvim_create_namespace("mariasolos/lsp_float")

			--- Adds extra inline highlights to the given buffer.
			---@param buf integer
			local function add_inline_highlights(buf)
				for l, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
					for pattern, hl_group in pairs({
						["@%S+"] = "@parameter",
						["^%s*(Parameters:)"] = "@text.title",
						["^%s*(Return:)"] = "@text.title",
						["^%s*(See also:)"] = "@text.title",
						["{%S-}"] = "@parameter",
						["|%S-|"] = "@text.reference",
					}) do
						local from = 1 ---@type integer?
						while from do
							local to
							from, to = line:find(pattern, from)
							if from then
								vim.api.nvim_buf_set_extmark(buf, md_namespace, l - 1, from - 1, {
									end_col = to,
									hl_group = hl_group,
								})
							end
							from = to and to + 1 or nil
						end
					end
				end
			end

			--- HACK: Override `vim.lsp.util.stylize_markdown` to use Treesitter.
			---@param bufnr integer
			---@param contents string[]
			---@param opts table
			---@return string[]
			---@diagnostic disable-next-line: duplicate-set-field
			vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
				contents = vim.lsp.util._normalize_markdown(contents, {
					width = vim.lsp.util._make_floating_popup_size(contents, opts),
				})
				vim.bo[bufnr].filetype = "markdown"
				vim.treesitter.start(bufnr)
				vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)

				add_inline_highlights(bufnr)
				return contents
			end
		end,
	},
}
