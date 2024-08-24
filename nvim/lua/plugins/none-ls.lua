return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.mix,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.sql_formatter,
				null_ls.builtins.formatting.ocamlformat,
				null_ls.builtins.formatting.zprint,
				null_ls.builtins.formatting.ktlint,
				null_ls.builtins.diagnostics.clj_kondo,
        -- Python
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
			},
		})
		local function format_buff()
			vim.lsp.buf.format({ timeout_ms = 3000, async = true })
		end
		vim.keymap.set("n", "<space>gf", format_buff, {})
	end,
}
