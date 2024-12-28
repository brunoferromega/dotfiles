local set = vim.opt

set.number = true
set.relativenumber = true
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.clipboard = "unnamedplus"

vim.wo.number = true

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<space>gf", function() vim.lsp.buf.format({ timeout_ms = 3000, async = true }) end, {})

-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
local original_floating_preview = vim.lsp.util.open_floating_preview

vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
  opts = vim.tbl_extend("force", opts or {}, { border = "rounded" })
  return original_floating_preview(contents, syntax, opts)
end
