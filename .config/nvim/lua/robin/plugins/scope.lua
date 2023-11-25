return {
	"tiagovla/scope.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local scope = require("scope")

		scope.setup({
			hooks = {
				pre_tab_enter = function()
					-- Your custom logic to run before entering a tab
					print("Create something beautiful")
				end,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>c", ":tabclose<cr>", { desc = "close the current working buffer" })
		keymap.set("n", "<leader>nw", ":tabnew<cr>", { desc = "create a new tab" })
		keymap.set("n", "<leader>tn", ":tabnext<cr>", { desc = "move to the next tab" })
		keymap.set("n", "<leader>tp", ":tabprevious<cr>", { desc = "move to the previous tab" })
	end,
}
