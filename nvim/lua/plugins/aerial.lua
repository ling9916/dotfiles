return {
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      disable_max_lines = 10000,
      disable_max_size = 1024 * 100,
      layout = { min_width = 28 },
      show_guides = true,
      filter_kind = false,
      guides = { mid_item = "├ ", last_item = "└ ", nested_top = "│ ", whitespace = "  " },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
    },
  },

}

