-- keymaps
--  See `:help vim.keymap.set()`
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('i', 'jk', '<ESC>')
-- split windows
map('n', '<leader>sv', '<C-w>v', opts)
map('n', '<leader>sh', '<C-w>s', opts)
map('n', '<leader>se', '<C-w>=', opts)
map('n', '<leader>sx', ':close<CR>', opts)

-- Set highlight on search, but clear on pressing <leader>nh in normal mode
map('n', '<leader>nh', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- playback macros
map('n', 'Q', '@qj', opts)
map('x', 'Q', ':norm @q<CR>', opts)

map('n', '<leader>re', '<cmd>restart<CR>', { desc = 'Restart neovim (:restart)' })
map('n', '<leader>u', '<cmd>Undotree<CR>', { desc = 'Toggle Undotree' })
