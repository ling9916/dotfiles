return {
  bashls = { language = "bash", opts = {} },

  clangd = {
    language = "c/c++",
    opts = {
      cmd = {
        "clangd",
        "--background-index",   -- 后台建立索引，并持久化到disk
        -- clang-format style to apply by default when no .clang-format file is found
        "--fallback-style=Darwin",

        "--clang-tidy",   -- 开启clang-tidy
        -- 指定clang-tidy的检查参数， 摘抄自cmu15445. 全部参数可参考 https://clang.llvm.org/extra/clang-tidy/checks
        "--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*,",
        "--completion-style=detailed",
        "--cross-file-rename=true",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
        -- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
        "--function-arg-placeholders=true",
        "--log=verbose",
        "--ranking-model=decision_forest",
        -- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
        "--header-insertion-decorators",
        "-j=12",
        "--pretty",
      }
    }
  },

  jsonls = { language = "json", opts = {} },

  lua_ls = {
    language = "lua",
    opts = {
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME, "${3rd}/luv/library", "${3rd}/busted/library" }
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            }
          })
          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
      end,
      settings = {
        lua = {
          hint = {
            enable = true,
            paramName = 'Literal',   -- "All"|"Literal"|"Disable"
            setType = true
          }
        },
      },
    },
  },

  pyright = { language = "python", opts = {} },


}

