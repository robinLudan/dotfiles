return {
	-- quickly install packages that don't need a lot of customizations
	"christoomey/vim-tmux-navigator", -- tmux and split terminal

	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		keys = {
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "toggle float terminal" },
			{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "toggle vertical terminal" },
			{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "toggle horizontal terminal" },
			{ "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", desc = "toggle tab terminal" },
		},
	},
}
