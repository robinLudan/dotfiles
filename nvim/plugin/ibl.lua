vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    vim.pack.add {
      { src = 'https://github.com/lukas-reineke/indent-blankline.nvim', name = 'ibl' },
    }
    require('ibl').setup()
  end,
})
