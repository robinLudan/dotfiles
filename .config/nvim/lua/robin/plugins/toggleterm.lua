return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>th", ":ToggleTerm direction=horizontal<CR>", desc = "Open a horizontal terminal" },
		{ "<leader>tv", ":ToggleTerm direction=vertical<CR>", desc = "Open a vertical terminal" },
		{ "<leader>tf", ":ToggleTerm direction=float<CR>", desc = "Open a floating terminal" },
	},
	config = function()
		require("toggleterm").setup({
			shade_terminals = false,
			shell = "zsh --login",
		})
	end,
}
