return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false,  -- This plugin is already lazy
  dependencies = {
    { "saecki/crates.nvim", tag = "stable" },
  },
  config = function()
    require("crates").setup({})
  end,
}
