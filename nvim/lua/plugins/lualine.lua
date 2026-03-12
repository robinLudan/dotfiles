return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    options = {
      section_separators = '',
      component_separators = '',
      globalstatus = true,
      theme = 'tokyonight',
    },
    sections = {
      lualine_a = {
        'mode',
      },
      lualine_b = {
        'branch',
        {
          'diff',
          symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
        },
        -- Cached LSP client count for better performance
        (function()
          local lsp_clients = 0
          local lsp_count = function()
            local clients = vim.lsp.get_clients()
            lsp_clients = #clients
            return lsp_clients > 0 and '󰅭 ' .. lsp_clients or ''
          end
          -- Update cache when LSP attaches/detaches
          vim.api.nvim_create_autocmd({ 'LspAttach', 'LspDetach' }, {
            callback = function()
              lsp_clients = #vim.lsp.get_clients()
            end,
          })
          return lsp_count
        end)(),
        { 'diagnostics', sources = { 'nvim_diagnostic' } },
      },
      lualine_c = {
        'filename',
      },
      lualine_x = {
        {
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#ff9e64' },
        },
      },
      lualine_y = {
        'filetype',
        'encoding',
        'fileformat',
        '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
      },
      lualine_z = {
        'progress',
        'location',
      },
    },
  },
}
