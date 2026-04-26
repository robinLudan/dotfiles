vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		local name, kind = event.data.spec.name, event.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not event.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

require("nvim-treesitter").setup({
	ensure_installed = {
		"bash",
		"html",
		"go",
		"javascript",
		"json",
		"lua",
		"luadock",
		"vimdock",
		"markdown",
		"markdown_inline",
		"php",
		"yaml",
		"css",
		"typescript",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = { enable = true },
})
