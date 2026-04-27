vim.pack.add {
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
}

require('gitsigns').setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']g', function()
      if vim.wo.diff then
        vim.cmd.normal { ']g', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end)

    map('n', '[g', function()
      if vim.wo.diff then
        vim.cmd.normal { '[g', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end)

    map('n', 'gp', function()
      if vim.wo.diff then
        vim.cmd.normal { 'gp', bang = true }
      else
        gitsigns.preview_hunk()
      end
    end)
  end,
}
