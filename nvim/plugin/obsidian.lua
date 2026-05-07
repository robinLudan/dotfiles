vim.pack.add {
  { src = 'https://github.com/epwalsh/obsidian.nvim', version = vim.version.range 'v3.*' },
  { src = 'nvim-lua/plenary.nvim' },
}

require('obsidian').setup {
  ui = { enable = false },
  workspaces = {
    {
      name = 'personal',
      path = '~/vaults/Personal',
    },
    {
      name = 'work',
      path = '~/vaults/Work',
    },
  },

  daily_notes = {
    folder = 'Daily',
    alias_format = '%B %-d, %Y',
    template = nil,
  },

  mappings = {
    vim.keymap.set('n', '<leader>ot', ':ObsidianToday<cr>'),
    vim.keymap.set('n', '<leader>on', ':ObsidianNew<cr>'),
    vim.keymap.set('n', '<leader>os', ':ObsidianSearch<cr>'),
    vim.keymap.set('n', '<leader>or', ':ObsidianRename<cr>'),
    vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<cr>'),
    vim.keymap.set('n', '<leader>ol', ':ObsidianLink<cr>'),
  },
}
