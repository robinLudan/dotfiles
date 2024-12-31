return { -- run tests with speed of thought xD
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', ':TestNearest<CR>', desc = '[T]est [N]earest' },
    { '<Leader>tf', ':TestFile<CR>', desc = '[T]est [F]ile' },
    { '<Leader>ts', ':TestSuite<CR>', desc = '[T]est [S]uite' },
    { '<Leader>tv', ':TestVisit<CR>', desc = '[T]est [V]isit' },
  },
  dependencies = { 'voldikss/vim-floaterm' },
  config = function()
    vim.cmd [[
      let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '--colors=always'

      function! FloatermStrategy(cmd)
        execute 'silent FloatermSend q'
        execute 'silent FloatermKill'
        execute 'FloatermNew! '.a:cmd.' |less -X'
      endfunction

      let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
      let g:test#strategy = 'floaterm'
    ]]
  end,
}
