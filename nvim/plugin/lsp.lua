vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim', version = vim.version.range 'v2.*' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/j-hui/fidget.nvim' },
}

require('mason').setup()
require('mason-lspconfig').setup()
require('fidget').setup {}
require('mason-tool-installer').setup {
  ensure_installed = {
    -- formatters
    'stylua',
    'prettierd',
    'prettier',
    'shfmt',
    'gofumpt',
    'goimports',
    'sqlfmt',
    'pint',

    -- linters
    'eslint_d',
    'markdownlint',
    'golangci-lint',
    'yamllint',
    'jsonlint',
    'shellcheck',

    -- lsp
    'lua_ls',
    'bashls',
    'tailwindcss-language-server',
    'ts_ls',
    'gopls',
    'sqls',
    'jsonls',
    'yamlls',
    'docker_compose_language_service',
    'dockerls',
    'intelephense',
    'phpactor',
  },
}

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd('LspAttach', { --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('gca', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    map('gtD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method('textDocument/documentHighlight', event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('UserLspHighlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('UserLspDetach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'UserLspHighlight', buffer = event2.buf }
        end,
      })
    end

    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
  end,
})

-- lsp servers configurations
-- format: vim.lsp.config["server_name"] = {...}
--
-- lua_ls
vim.lsp.config['lua_ls'] = {
  -- Command and arguments to start the server.
  cmd = { 'lua-language-server' },
  -- Filetypes to automatically attach to.
  filetypes = { 'lua' },
  -- Sets the "workspace" to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = {
    { '.emmyrc.json', '.luarc.json', '.luarc.jsonc' },
    { '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml' },
    { '.git' },
  },
  -- Specific settings to send to the server. The schema is server-defined.
  -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.config['phpactor'] = {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_markers = { '.git', 'composer.json', '.phpactor.json', '.phpactor.yml' },
  workspace_required = true,
  init_options = {
    ['language_server.diagnostics_on_update'] = false,
    ['language_server.diagnostics_on_open'] = false,
    ['language_server.diagnostics_on_save'] = false,
    ['language_server_phpstan.enabled'] = false,
    ['language_server_psalm.enabled'] = false,
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.completionProvider = nil
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.signatureHelpProvider = nil
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.referencesProvider = false
  end,
}
