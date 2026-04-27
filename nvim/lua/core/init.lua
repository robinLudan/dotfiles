-- enable default plugins (disabled by default)
vim.cmd.packadd 'nvim.undotree'

require 'core.colorscheme'
require 'core.options'
require 'core.autocmds'
vim.schedule(function() -- lazy load keymaps
  require 'core.keymaps'
end)
