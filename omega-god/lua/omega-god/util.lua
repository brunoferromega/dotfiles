local util = {}
local omega_god = require("omega-god.omega-god")

function util.load_hl_group(hl_group)
	for group, attribute in pairs(hl_group) do
		vim.api.nvim_set_hl(0, group, attribute)
	end
end

function util.load_theme()
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "omega-god"

	local editor = omega_god.load_editor()
	local syntax = omega_god.load_syntax()
	local lsp = omega_god.load_lsp()
	local treesitter = omega_god.load_treesitter()
	local coc = omega_god.load_coc()
	local notify = omega_god.load_notify()

	util.load_hl_group(editor)
	util.load_hl_group(syntax)
	util.load_hl_group(lsp)
	util.load_hl_group(treesitter)
	util.load_hl_group(coc)
	util.load_hl_group(notify)
end

return util
