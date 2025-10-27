return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp',
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load {}
            end,
          },
        },
        opts = {},
        config = function()
          local ls = require 'luasnip'
          local s = ls.snippet
          local t = ls.text_node
          local i = ls.insert_node
          local c = ls.choice_node
          local fmt = require('luasnip.extras.fmt').fmt

          vim.keymap.set({ 'i', 's' }, '<C-c>', function()
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end, { silent = true })

          ls.add_snippets('php', {
            s(
              'func',
              fmt(
                [[
                  {} function {}({}){} 
                  {{
                      {}
                  }}
                ]],
                {
                  c(1, {
                    t 'public',
                    t 'protected',
                    t 'private',
                    t 'public static',
                  }),
                  i(2, 'name'),
                  i(3),
                  i(4),
                  i(0),
                }
              )
            ),
            s(
              'itt',
              fmt(
                [[
                  it("{}", function({}){{
                      {}
                  }});
                ]],
                { i(1, 'does something'), i(2), i(0) }
              )
            ),
          })
        end,
      },
      'nvim-tree/nvim-web-devicons',
      'onsails/lspkind-nvim', -- for "vs-code" like icons
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',
        ['<C-space>'] = false,
        ['<C-b>'] = false,
        ['<C-f>'] = false,

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = { auto_show = false },
        menu = {
          border = 'rounded',
          draw = {
            columns = {
              { 'kind_icon', 'label', gap = 1 },
              { 'kind' },
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  return require('lspkind').symbolic(ctx.kind, {
                    mode = 'symbol',
                  })
                end,
              },
            },
          },
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'prefer_rust_with_warning' },

      -- Shows a signature help window while you type arguments for a function
      signature = {
        enabled = true,
        window = { show_documentation = false },
      },
    },
  },
}
