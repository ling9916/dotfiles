return {
  'nvim-lualine/lualine.nvim',
  event = 'UIEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons', },
  opts = {
    options = {
      theme = 'auto',
      disabled_filetypes = {           -- Filetypes to disable lualine for.
        statusline = { "neo-tree" },   -- only ignores the ft for statusline.
        winbar = {},                   -- only ignores the ft for winbar.
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { {
        'filename',
        file_status = true,   -- displays file status (readonly status, modified status)
        path = 0              -- 0 = just filename, 1 = relative path, 2 = absolute path
      } },
      lualine_x = {
        {
          'diagnostics',
          sources = { "nvim_diagnostic" },
          symbols = {
            error = ' ',
            warn = ' ',
            info = ' ',
            hint = ' '
          }
        },
        'encoding',
        'filetype'
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { {
        'filename',
        file_status = true,   -- displays file status (readonly status, modified status)
        path = 1              -- 0 = just filename, 1 = relative path, 2 = absolute path
      } },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = { 'fugitive' }
  },
}

