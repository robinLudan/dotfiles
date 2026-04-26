-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true -- set to true if you have nerd font installed

-- enable some default plugins
vim.cmd.packadd("nvim.undotree")

-- initialize core utilities
require("core.init")
