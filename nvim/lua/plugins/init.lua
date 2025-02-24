return { -- short plugins that don't need much configuration (if any)
  { 'tpope/vim-sleuth' },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- maximize split windows
    'szw/vim-maximizer',
    keys = {
      { '<leader>m', '<cmd>MaximizerToggle<CR>', desc = '[M]aximize/[M]inimize a split' },
    },
  },
  { -- navigate seamlessly between vim and tmux with ctrl{h,j,k,l}
    'christoomey/vim-tmux-navigator',
    event = 'VeryLazy',
  },
  { -- blade highlighting
    'jwalton512/vim-blade',
    ft = 'blade',
  },
}
