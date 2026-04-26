local function ensure_fzf_build()
	local fzf_native_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
	local lib_file = fzf_native_path .. "/build/libfzf.so"
	-- Check if the library exists; if not, try to build it immediately
	if vim.fn.filereadable(lib_file) == 0 then
		vim.notify("fzf-native binary missing. Attempting to build...", vim.log.levels.WARN)
		vim.system({ "make" }, { cwd = fzf_native_path }):wait()
	end
end

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Build telescope-fzf-native after install/update",
	group = vim.api.nvim_create_augroup("telescope-fzf-native_build", { clear = true }),
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			vim.notify("Building telescope-fzf-native...", vim.log.levels.INFO)
			vim.system({ "make" }, { cwd = ev.data.path }, function(obj)
				vim.schedule(function()
					if obj.code == 0 then
						vim.notify("fzf-native build complete.", vim.log.levels.INFO)
					else
						vim.notify("fzf-native build failed!", vim.log.levels.ERROR)
					end
				end)
			end)
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("v0.*") },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

ensure_fzf_build()

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- "smart_case" (default) "ignore_case" or "respect_case"
		},
	},
})

-- Enable Telescope extensions (should be installed alongside telescope)
require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
	callback = function(event)
		local buf = event.buf
		vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })
		vim.keymap.set("n", "gi", builtin.lsp_implementations, { buffer = buf, desc = "[G]oto [I]mplementation" })
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })
		vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { buffer = buf, desc = "Open Document Symbols" })
		vim.keymap.set(
			"n",
			"gW",
			builtin.lsp_dynamic_workspace_symbols,
			{ buffer = buf, desc = "Open Workspace Symbols" }
		)
		vim.keymap.set("n", "gD", builtin.lsp_type_definitions, { buffer = buf, desc = "[G]oto [T]ype Definition" })
	end,
})
