return {
  dir = "~/.dotfiles/omega-god",
  name = "omega-god",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("omega-god")
  end,
}
