return {
	-- quickly install packages that don't need a lot of customizations
	"christoomey/vim-tmux-navigator", -- tmux and split terminal

	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
			local keymap = vim.keymap
			keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
			keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
			keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>")
			keymap.set("n", "<leader>tt", ":ToggleTerm direction=tab<CR>")
		end,
	},
}
