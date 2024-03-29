--[[
    Nvim config of base options
--]]

local define_sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

local function define_options(options)
  for _, val in pairs(options) do
    vim.o[_] = val
  end
end

vim.g.mapleader = ';'
vim.g.nobackup = true
vim.g.nowritebackup = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

define_sign({name = 'DiagnosticSignError', text = ''})
define_sign({name = 'DiagnosticSignWarn', text = ''})
define_sign({name = 'DiagnosticSignHint', text = ''})
define_sign({name = 'DiagnosticSignInfo', text = ''})

define_options({
  cursorline = true,
  termguicolors = true,
  number = true,
  smartcase = true,
  wrap = true,
  ic = true,
  autochdir = true,
  autoindent = true,
  smartindent = true,
  expandtab = true,
  showcmd = true,
  showmatch = true,
  ruler = true,
  lazyredraw = true,
  visualbell = true,
  hlsearch = true,
  incsearch = true,
  list = true,
  wildmenu = true,
  relativenumber = true,
  hidden = true,
  clipboard = 'unnamedplus',-- use stystem's clipboard , install 'xclip' first
  encoding = 'utf-8',
  fileformats = 'unix',
  mouse = '',
  tabstop = 2,
  shiftwidth = 2,
  history = 800,
  scrolloff = 5,
  wildmode = 'full',
  foldmethod = 'marker',
  foldlevelstart = 99,
  laststatus = 3, -- nvim0.7 feature - for global status line
  signcolumn = 'yes',
  showtabline = 1,
  updatetime = 100,
  cmdheight = 1
})
