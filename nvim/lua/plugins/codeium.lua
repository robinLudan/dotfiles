return { -- free AI tool for code suggestions
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.cmd [[
      imap <script><silent><nowait><expr> <M-y> codeium#Accept()
      imap <M-n>   <Cmd>call codeium#CycleCompletions(1)<CR>
      imap <M-p>   <Cmd>call codeium#CycleCompletions(-1)<CR>
      imap <M-c>   <Cmd>call codeium#Clear()<CR>
      let g:codeium_no_map_tab = v:true
    ]]
    end,
  },
}
