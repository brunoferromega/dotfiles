package.loaded["omega-god"] = nil
package.loaded["omega-god.colors"] = nil
package.loaded["omega-god.eidolon"] = nil
package.loaded["omega-god.util"] = nil

require("omega-god").set()

local ok, _ = pcall(vim.cmd, "colorscheme omega-god")
if not ok then
	vim.cmd("colorscheme default")
end
