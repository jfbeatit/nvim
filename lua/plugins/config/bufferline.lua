local bufferline = require('bufferline')

bufferline.setup({
  highlights = {
    buffer_selected = {
      fg = '#c678dd',
      bg = 'None',
      bold = true,
    },
  },
  options = {
    style_preset = bufferline.style_preset.no_italic,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = true,
    show_buffer_close_icons = false,
    numbers = 'ordinal',
    indicator = {
      icon = '', -- this should be omitted if indicator style is not 'icon'
      style = 'None',
    },
    offsets = {
      {
        filetype = 'NvimTree',
        text = ' 󱘎 File Explorer',
        highlight = 'Directory',
        text_align = 'left'
      },
    }
  }
})
