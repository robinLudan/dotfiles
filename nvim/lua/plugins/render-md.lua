return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown', -- lazy load for markdown files only
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
