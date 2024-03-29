require('lspsaga').setup({
  ui = {
    -- currently only round theme
    theme = 'round',
    -- border type can be single,double,rounded,solid,shadow.
    border = 'single',
    winblend = 0,
    expand = '',
    collapse = '',
    preview = '',
    code_action = '',
    diagnostic = '🐞',
    incoming = ' ',
    outgoing = ' ',
    colors = {
      --float window normal bakcground color
      normal_bg = 'None',
      --title background color
      title_bg = '#afd700',
      red = '#e95678',
      magenta = '#b33076',
      orange = '#FF8700',
      yellow = '#f7bb3b',
      green = '#afd700',
      cyan = '#36d0e0',
      blue = '#61afef',
      purple = '#CBA6F7',
      white = '#d1d4cf',
      black = '#1c1c19',
    },
  },
  -- same as nvim-lightbulb but async
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = true,
  },
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' > ',
    show_file = true,
    -- define how to customize filename, eg: %:., %
    -- if not set, use default value `%:t`
    -- more information see `vim.fn.expand` or `expand`
    -- ## only valid after set `show_file = true`
    file_formatter = "%:p., %",
    click_support = false,
  },
  -- show outline
  outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  rename = {
    quit = '<C-c>',
    exec = '<CR>',
    mark = 'x',
    confirm = '<CR>',
    in_select = true,
    whole_project = true,
  },
})

local keymap = vim.keymap.set
-- Lsp finder find the symbol definition implement reference
keymap("n", "gs", "<cmd>Lspsaga finder<CR>", { silent = true })
-- Peek Definition
-- you can edit the definition file in this flaotwindow
---also support open/vsplit/etc operation check definition_action_keys
---support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

--Rename
keymap("n", "rn", "<cmd>Lspsaga rename<CR>", { silent = true })

--Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

--Only jump to error
keymap('n', '<Leader>e', function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, options)

---- Outline
keymap("n", "<Leader>t", "<cmd>Lspsaga outline<CR>",{ silent = true })
