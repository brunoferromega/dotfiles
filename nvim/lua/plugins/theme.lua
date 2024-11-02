return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    local blue_eletric = "#45dcf3"
    local string_yellow = "#F2E2BA"
    local salmon = "#F5816C"
    local indigo = "#7D83FF"
    local green_yellow = "#AFFC41"
    local green_blue = "#76B9AC"

    require("rose-pine").setup({
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
        migrations = true,     -- Handle deprecated options automatically
      },

      variant = "moon",
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },

      highlight_groups = {
        Identifier = { fg = salmon, bold = false, italic = true },
        Conditional = { fg = indigo, italic = true },
        Boolean = { fg = "love", italic = true },
        Keyword = { fg = indigo, italic = true },
        Include = { italic = true },
        String = { fg = string_yellow },
        Number = { fg = green_blue },
        Float = { fg = green_blue },
        ["@function"] = { fg = blue_eletric, italic = false },
        ["@function.method"] = { fg = blue_eletric, italic = false },
        ["@function.builtin"] = { fg = blue_eletric, italic = true, bold = false },
        ["@function.method.call"] = { fg = blue_eletric, italic = false },
        ["@variable"] = { italic = false },
        ["@variable.parameter"] = { fg = "text", italic = false },
        ["@variable.member"] = { fg = "text" },
        ["@module"] = { fg = "rose" },
        ["@operator"] = { fg = green_yellow },
        ["@keyword.operator"] = { fg = green_yellow },
        ["@keyword.return"] = { fg = indigo, italic = true },
        ["@keyword.conditional"] = { fg = indigo, italic = true },
        ["@keyword.repeat"] = { fg = indigo, italic = true },
        ["@keyword.import"] = { fg = indigo, italic = true },
        ["@punctuation.special"] = { fg = green_yellow },
        ["@constant"] = { fg = "love" },
        ["@constant.builtin"] = { fg = "love", bold = true },
        ["@constant.macro"] = { fg = blue_eletric, italic = false },
        ["@type"] = { fg = salmon },
        ["@type.builtin"] = { fg = salmon, bold = true },
        ["@property"] = { fg = "text", italic = false },
        ["@attribute"] = { fg = "text", italic = false, bold = true },
      },
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
