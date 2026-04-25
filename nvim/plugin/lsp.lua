vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup({})
require("fidget").setup({})
require("mason-tool-installer").setup({
	ensure_installed = {
		-- formatters
		"stylua",
		"prettierd",
		"prettier",
		"shfmt",
		"gofumpt",
		"goimports",
		"sqlfmt",
		"pretty-php",

		-- linters
		"eslint_d",
		"markdownlint",
		"golangci-lint",
		"yamllint",
		"jsonlint",
		"shellcheck",

		-- lsp
		"lua_ls",
		"bashls",
		"tailwindcss-language-server",
		"ts_ls",
		"gopls",
		"sqls",
		"jsonls",
		"yamlls",
		"docker_compose_language_service",
		"dockerls",
		"intelephense",
		"phpactor",
	},
	auto_update = false,
	run_on_start = true,
})

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd(
	"LspAttach",
	{ --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(event)
			local map = function(keys, func, desc, mode)
				mode = mode or "n"
				vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end
			map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
			map("gca", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
			map("gtD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			map("K", vim.lsp.buf.hover, "Hover Documentation")

			-- The following two autocommands are used to highlight references of the
			-- word under your cursor when your cursor rests there for a little while.
			--    See `:help CursorHold` for information about when this is executed
			-- When you move your cursor, the highlights will be cleared (the second autocommand).
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if client and client:supports_method("textDocument/documentHighlight", event.buf) then
				local highlight_augroup = vim.api.nvim_create_augroup("UserLspHighlight", { clear = false })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})

				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("UserLspDetach", { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({ group = "UserLspHighlight", buffer = event2.buf })
					end,
				})
			end

			if client and client:supports_method("textDocument/inlayHint", event.buf) then
				map("<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
				end, "[T]oggle Inlay [H]ints")
			end
		end,
	}
)
