vim.pack.add {
  'https://github.com/stevearc/conform.nvim',
}

require('conform').setup {
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    sh = { 'shfmt' },
    php = function(bufnr)
      if require('conform').get_formatter_info('pint', bufnr).available then
        return { 'pint' }
      else
        return { 'pretty-php' }
      end
    end,
    vue = { 'prettierd' },
    html = { 'prettierd' },
    css = { 'prettierd' },
    scss = { 'prettierd' },
    graphql = { 'prettierd' },
    json = { 'prettierd' },
    jsonc = { 'prettierd' },
    yaml = { 'prettierd' },
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    markdown = { 'prettierd' },
    go = { 'goimports', 'gofumpt' },
    javascriptreact = { 'prettierd' },
    typescriptreact = { 'prettierd' },
  },
  formatters = {
    pint = {
      command = 'vendor/bin/pint',
    },
  },
}
