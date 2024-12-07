return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "j-hui/fidget.nvim" },
		{ "folke/lazydev.nvim" },
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"csharp_ls",
				"gopls",
				"jdtls",
				"ts_ls",
				"pylsp",
			},
			automatic_installation = false,
		})

		require("cmp").setup({
			completion = { autocomplete = false },
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
			capabilities = capabilities,
		})

		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					diagnostics = {
						enable = false,
					},
				},
			},
			capabilities = capabilities,
		})

		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		lspconfig.csharp_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})

		lspconfig.pylsp.setup({
			capabilities = capabilities,
		})

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.jdtls.setup({
			capabilities = capabilities,
		})

		lspconfig.vimls.setup({
			capabilities = capabilities,
		})
	end,
}
