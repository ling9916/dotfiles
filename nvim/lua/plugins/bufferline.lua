return {
  'akinsho/bufferline.nvim',
  event = 'UIEnter',

  opts = {
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer", -- "File Explorer" | function ,
          text_align = "center",  -- "left" | "center" | "right"
          separator = true,
        },
      },
    },
  },
}

