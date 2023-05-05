local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-tree/nvim-web-devicons',
    lock = true,
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    opt = true,
    event = 'InsertEnter'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require('plugins.config.treesitter')
    end,
    opt = true,
    event = 'BufEnter'
  }
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly',
    config = function()
      require('plugins.config.tree')
    end
  }
  use {
    'folke/tokyonight.nvim',
    branch = 'main',
    config = function()
      require('plugins.config.tokyonight')
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.config.lualine')
    end,
    opt = true,
    event = 'BufRead'
  }
  use {
    'nvimdev/indentmini.nvim',
    config = function()
      require('plugins.config.indentmini')
    end,
    opt = true,
    event = 'BufRead',
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
    opt = true,
    event = 'BufEnter'
  }
  use {
    'voldikss/vim-floaterm',
    config = function()
      require('plugins.config.floaterm')
    end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.config.gitsigns')
    end,
    opt = true,
    event = 'BufRead'
  }
  use {
    'voldikss/vim-translator',
    config = function()
      require('plugins.config.translator')
    end,
    opt = true,
    event = 'BufRead'
  }
  use {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end,
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup()
    end,
  }
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      {'onsails/lspkind.nvim', lock = true},
    },
    after = 'nvim-autopairs',
    config = function()
      require('plugins.config.lspconfig')
    end,
  }
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require('plugins.config.lspsaga')
    end,
  }
  use {
    'simrat39/rust-tools.nvim',
    config = function()
      require('plugins.config.rust-tools')
    end,
    ft = 'rust',
  }
  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end,
    opt = true,
    event = 'BufRead'
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    opt = true,
    ft = { "markdown" },
  }
  use {
    -- eyJhbGciOiJSUzI1NiIsImtpZCI6ImI2NzE1ZTJmZjcxZDIyMjQ5ODk1MDAyMzY2ODMwNDc3Mjg2Nzg0ZTMiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoic2hlbmcgemVuZyIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BR05teXhZVEpHNlFiV05GcHdHNERsRnRoR2VFUnNXR09QZC1Cb0lsWE9FcD1zOTYtYyIsImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9leGEyLWZiMTcwIiwiYXVkIjoiZXhhMi1mYjE3MCIsImF1dGhfdGltZSI6MTY4MzE3NTA5MSwidXNlcl9pZCI6Ikxqb2xmdGwxSTBkako4RGZSZlpoYVBlY2RhajEiLCJzdWIiOiJMam9sZnRsMUkwZGpKOERmUmZaaGFQZWNkYWoxIiwiaWF0IjoxNjgzMTc1MTQ0LCJleHAiOjE2ODMxNzg3NDQsImVtYWlsIjoiamZiZWF0aXQyMDIzQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7Imdvb2dsZS5jb20iOlsiMTA4ODUxNDM0MTg2MDg1NDc1ODMwIl0sImVtYWlsIjpbImpmYmVhdGl0MjAyM0BnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJnb29nbGUuY29tIn19.roypvf2arWflkq893lyhD9oUuRJ4Igh5WLmkKNFztKJZj1GPRw5oUvtiHZXDSSPO_57MxKTO2etMnGKRlWRpdppbwtlMFbJBdbhq2W-zMxpLgr-K3x5nR3sfRJfkesJTO7vN7kEZpCcnOUBuyG2AnTs1UaLs09bj5mC-FBsZDhDgE7MfHNwWkPSsP3z_PH0ZuPauK1LoTJKj4fV6fEIy5QFvsFVsI2Xac2_lsd7R9qtrtehLrL1BkYugNhmy5NSbNvfprFgWo-ulhBmvkPvv7b28KxNMl3ECurO6jn-nyR56LPW87reTH6PRmjETIHFzTZLB23Uqm2vdRfJHzo-dbg
    'Exafunction/codeium.vim',
    config = function()
      require('plugins.config.codeium')
    end,
    opt = true,
    event = 'BufRead'
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
