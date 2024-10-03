return {
	"williamboman/mason-lspconfig",
	dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	config = function()
		local masonLspconfig = require("mason-lspconfig")
		masonLspconfig.setup({})

		local lspconfig = require("lspconfig")
		masonLspconfig.setup_handlers({
			function (server_name)
				lspconfig[server_name].setup({})
			end
		})
		
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = {buffer = event.buf}

				-- these will be buffer-local keybindings
				-- because they only work if you have an active language server

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
				vim.keymap.set({"n", "x"}, "<F3>", function()
					vim.lsp.buf.format({async = true})
				end, opts)
				vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
			end
		})

	end
}
