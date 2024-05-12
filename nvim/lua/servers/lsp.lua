return {
  lua_ls = {
    language = "lua",
    opts = {
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          codeLens = {
            enable = true,
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    },
  },
}
