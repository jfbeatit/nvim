local ft = require('guard.filetype')

ft('rust'):fmt('rustfmt')
ft('javascript'):fmt('prettier')
ft('typescript'):fmt('prettier')
ft('typescriptreact'):fmt('prettier')
ft('vue'):fmt('prettier')
ft('html'):fmt('prettier')
ft('css'):fmt('prettier')
ft('jsonc'):fmt('prettier')

require('guard').setup({
  fmt_on_save = true,
})
