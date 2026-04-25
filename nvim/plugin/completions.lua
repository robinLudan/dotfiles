vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("v1.*") },
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("v2.*") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/onsails/lspkind-nvim" },
})

require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
	snippets = { preset = "luasnip" },
	keymap = {
		preset = "default",
		["<C-Space>"] = false,
		["<C-b>"] = false,
		["<C-f>"] = false,
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = false },
		menu = {
			border = "rounded",
			draw = {
				columns = {
					{ "kind_icon", "label", gap = 1 },
					{ "kind" },
				},
				components = {
					kind_icon = {
						text = function(ctx)
							return require("lspkind").symbolic(ctx.kind, {
								mode = "symbol",
							})
						end,
					},
				},
			},
		},
	},
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust_with_warning" },
	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			sql = { "lsp", "snippets", "buffer" },
			lua = { "lazydev", "lsp", "path", "snippets", "buffer" },
		},
		providers = {
			lsp = {
				score_offset = 90,
			},
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
})
