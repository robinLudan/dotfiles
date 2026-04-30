-- keymaps
--  See `:help vim.keymap.set()`
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local maximized = false
local function toggle_maximize_or_equalize()
  if maximized then
    vim.cmd 'wincmd ='
  else
    vim.cmd 'wincmd |'
    vim.cmd 'wincmd _'
  end
  maximized = not maximized
end

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

-- Keybinds to resize windows
--  Use Alt+<hjkl> to resize windows
map('n', '<M-h>', '<cmd>vertical resize +5<cr>', { desc = 'Make window bigger vertially' })
map('n', '<M-l>', '<cmd>vertical resize -5<cr>', { desc = 'Make window smaller vertially' })
map('n', '<M-j>', '<cmd>horizontal resize +2<cr>', { desc = 'Make window bigger horizontally' })
map('n', '<M-k>', '<cmd>horizontal resize -2<cr>', { desc = 'Make window smaller horizontally' })
map('n', '<leader>m', toggle_maximize_or_equalize, { desc = 'Toggle maximize/equalize' })

-- playback macros
map('n', 'Q', '@qj', opts)
map('x', 'Q', ':norm @q<CR>', opts)

map('n', '<leader>re', '<cmd>restart<CR>', { desc = 'Restart neovim (:restart)' })
map('n', '<leader>u', '<cmd>Undotree<CR>', { desc = 'Toggle Undotree' })
