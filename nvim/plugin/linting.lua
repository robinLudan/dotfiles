vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  group = vim.api.nvim_create_augroup('LazyLoadLint', { clear = true }),
  callback = function()
    vim.pack.add {
      { src = 'https://github.com/mfussenegger/nvim-lint' },
    }

    local lint = require 'lint'
    lint.linters_by_ft = {
      markdown = { 'markdownlint' },
      go = { 'golangcilint' },
      yaml = { 'yamllint' },
      json = { 'jsonlint' },
    }

    -- autocmd that does the actual linting
    local lint_augroup = vim.api.nvim_create_augroup('lint-logic', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })

    if vim.bo.modifiable then
      lint.try_lint()
    end

    vim.api.nvim_del_augroup_by_name 'LazyLoadLint'
  end,
})
