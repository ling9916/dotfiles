return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    dependencies = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    main = 'nvim-treesitter.configs',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { "c", "cpp", "go", "html", "json", "lua", "python", "toml", "vim", "vimdoc" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  }

}

