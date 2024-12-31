return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = 'markdown',
  -- Replace the below lines(event*) with the above if you only want to load obsidian.nvim
  -- for markdown files anywhere, currently only loads obsidian with the ones in
  -- your vault
  event = {
    'BufReadPre /home/robin/vaults/**.md',
    'BufNewFile /home/robin/vaults/**.md',
  },
  keys = {
    { '<leader>ot', ':ObsidianToday<CR>', { desc = '[O]bisidian [T]oday' } },
    { '<leader>on', ':ObsidianNew<CR>', { desc = '[O]bisidian [N]ew' } },
    { '<leader>os', ':ObsidianSearch<CR>', { desc = '[O]bisidian [S]earch' } },
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
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
      -- Optional, if you keep daily notes in a separate directory.
      folder = 'Daily',
      -- Optional, if you want to change the date format for the ID of daily notes.
      -- date_format = '%Y-%m-%d',
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = '%B %-d, %Y',
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil,
    },

    mappings = {
      vim.keymap.set('n', '<leader>od', ':ObsidianDailies<cr>'),
      vim.keymap.set('n', '<leader>or', ':ObsidianRename<cr>'),
      vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<cr>'),
      vim.keymap.set('n', '<leader>ol', ':ObsidianLink<cr>'),
    },
  },
}
