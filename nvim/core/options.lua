vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.confirm = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.synmaxcol = 300
vim.opt.wildoptions:append("pum")
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.opt.iskeyword:append("-")
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
