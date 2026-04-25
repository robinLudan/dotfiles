vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		sh = { "shfmt" },
		javascript = { "prettierd" },
		-- other examples on usage
		-- javascript = { 'prettierd', 'prettier', stop_after_first = true },
		-- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		-- rust = { "rustfmt", lsp_format = "fallback" },
	},
})
