require("core.colorscheme")
require("core.options")
require("core.autocmds")
vim.schedule(function() -- lazy load keymaps
	require("core.keymaps")
end)
