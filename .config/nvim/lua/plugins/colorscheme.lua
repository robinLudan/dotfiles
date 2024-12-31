return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local transparent = false

    local bg = '#020C1E'
    local bg_dark = '#020C1E'
    local bg_search = '#0A64AC'
    local fg = '#CBE0F0'
    local fg_dark = '#B4D0E9'

    require('tokyonight').setup {
      style = 'night',
      transparent = transparent,
      styles = {
        sidebars = transparent and 'transparent' or 'dark',
        floats = transparent and 'transparent' or 'dark',
      },
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = transparent and colors.none or bg_dark
        colors.bg_float = transparent and colors.none or bg_dark
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = transparent and colors.none or bg_dark
        colors.bg_statusline = transparent and colors.none or bg_dark
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_sidebar = fg_dark
        colors.gitSigns = {
          add = colors.teal,
          change = colors.purple,
          delete = colors.red,
        }
      end,
    }

    vim.cmd 'colorscheme tokyonight'
  end,
}
