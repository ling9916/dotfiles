return {
  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim'
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        get_selection_window = function()
          local wins = vim.api.nvim_list_wins()
          table.insert(wins, 1, vim.api.nvim_get_current_win())
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == "" then
              return win
            end
          end
          return 0
        end,
        mappings = {
          i = {
            --[[
              ["<c-t>"] = open_with_trouble,
              ["<a-t>"] = open_selected_with_trouble,
              ["<a-i>"] = find_files_no_ignore,
              ["<a-h>"] = find_files_with_hidden,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
              ]] --
          },
          n = {
            -- ["q"] = actions.close,
          },
        },
      },

      extensions = {
        ["ui-select"] = {
          function()
            require("telescope.themes").get_cursor {
              -- even more opts
            }
          end,

        },
      },
    },
    config = function()
      require("telescope").load_extension("ui-select")
    end
  },

}

