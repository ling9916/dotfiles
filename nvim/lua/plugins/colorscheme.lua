return {

  -- everforest
  {
    "neanias/everforest-nvim",
    priority = 1000,   -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
  },

  -- one dark
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    opts = {
      style = 'dark',   -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    }
  }

}

