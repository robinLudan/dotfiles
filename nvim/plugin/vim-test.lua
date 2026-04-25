vim.pack.add({
	{ src = "https://github.com/vim-test/vim-test" },
	{ src = "https://github.com/voldikss/vim-floaterm" },
})

vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>", { desc = "[T]est [N]earest" })
vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>", { desc = "[T]est [F]ile" })
vim.keymap.set("n", "<Leader>ts", ":TestSuite<CR>", { desc = "[T]est [S]uite" })
vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>", { desc = "[T]est [V]isit" })

vim.cmd([[
  let test#php#phpunit#options = '--colors=always'
  let test#php#pest#options = '--colors=always'

  function! FloatermStrategy(cmd)
  execute 'silent FloatermSend q'
  execute 'silent FloatermKill'
  execute 'FloatermNew! '.a:cmd.' |less -X'
  endfunction

  let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
  let g:test#strategy = 'floaterm'
]])
