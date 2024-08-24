return {
	"nvim-lualine/lualine.nvim",
  dependencies = { "rose-pine/neovim", name = "rose-pine" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "rose-pine",
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", separator = { right = "", left = "" }, right_padding = 2 } },
				lualine_b = { "filename", "branch" },
				lualine_c = {
					"%=", --[[ add your center compoentnts here in place of this comment ]]
				},
				lualine_x = {},
				lualine_y = { { "filetype", separator = { left = "" } }, "progress" },
				lualine_z = {
					{ "location", separator = { right = "", left = "" }, left_padding = 1 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
