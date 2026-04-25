vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

require("oil").setup({
	columns = { "icon" },

	keymaps = {
		["<C-h>"] = false,
		["<C-l>"] = false,
		["<C-k>"] = false,
		["<C-j>"] = false,
		["<M-h>"] = "actions.select_split",
	},

	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
})
