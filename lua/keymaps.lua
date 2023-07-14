local keymap = vim.api.nvim_set_keymap
local options = { silent = true }

function get_root_dir()
  local path = vim.fn.expand('%:p:h')
  while path ~= '/' do
    if vim.fn.glob(path .. '/.git') ~= '' or vim.fn.glob(path .. '/package.json') ~= '' then
      return path
    end
    path = vim.fn.fnamemodify(path, ':h')
  end
  return path
end

--for neoformat
keymap('n', 'nf', '<cmd>GuardFmt<CR>', options)

--for plugin flybuf
keymap('n', '<C-f>', ':FlyBuf<CR>', options)

--for plugin nvim-tree
keymap('n', '<C-b>', ':NvimTreeToggle<CR>', options)

--for plugin markdown-preview
keymap('n', '<C-m>', '<Plug>MarkdownPreviewToggle', options)

--for plugin nvim-telescope
keymap('n', '<Leader>f', ':lua require("telescope.builtin").find_files({ search_dirs = { get_root_dir() } })<CR>', options)
keymap('n', '<Leader>s', ':lua require("telescope.builtin").live_grep({ search_dirs = { get_root_dir() } })<CR>', options)

--for plugin lsp
keymap('n', '<Leader>r', ':LspRestart<CR>', options)

--for plugin nvim-trouble
--keymap('n', '<Leader>e', ':TroubleToggle<CR>', options)

--for plugin translator
keymap('n', '<C-y>', ':TranslateW<CR>', options)

--for plugin bufferline
keymap('n', '<C-h>', '<Cmd>BufferLineCyclePrev<CR>', options)
keymap('n', '<C-l>', '<Cmd>BufferLineCycleNext<CR>', options)
keymap('n', '<C-x>', '<Cmd>bd!<CR>', options)
