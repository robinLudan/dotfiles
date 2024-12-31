return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, blade = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
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
      blade = { 'blade-formatter' },
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
  },
}
