return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = { package_installed = "✓", package_uninstalled = "✗", package_pending = "⟳", },
      },
    },
  },


  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'folke/neoconf.nvim',
      "folke/neodev.nvim",
    },
    config = function()
      -- replace default diagnostic signs
      -- more:https://neovim.io/doc/user/diagnostic.html#diagnostic-signs
      local signs = { Error = "", Warn = "", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- set the style of lsp info
      vim.diagnostic.config {
        virtual_text = true,           -- disable virtual text
        signs = { active = signs, },   -- show signs
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = { focusable = false, style = "minimal", border = "rounded", source = "always", header = "", prefix = "", }
      }

      -- set the popup window border
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
        { border = "rounded" })

      --- The `on_attach` function used
      local on_attach = function(_, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local keymap = vim.keymap.set
        -- setup mason-config mappings if available
        if require('config.utils').is_available "mason-lspconfig.nvim" then
          keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP information" })
        end

        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        keymap("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Hover diagnostics" })
        keymap("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
        keymap("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        keymap("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "Declaration of current symbol" })
        keymap("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Show the definition of current symbol" })
        keymap("n", "gy", function() vim.lsp.buf.type_definition() end, { desc = "Definition of current type", })
        keymap("n", "gI", function() vim.lsp.buf.implementation() end, { desc = "Implementation of current symbol" })
        keymap("n", "gr", function() vim.lsp.buf.references() end, { desc = "References of current symbol" })

        keymap("n", "K", function() vim.lsp.buf.hover() end, { desc = "Hover symbol details" })
        keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })
        keymap("v", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })
        keymap("n", "<leader>ld", function() vim.diagnostic.open_float() end, { desc = "Hover diagnostics" })
        keymap("n", "<leader>lG", function() vim.lsp.buf.workspace_symbol() end, { desc = "Search workspace symbols" })
        keymap("n", "<leader>lh", function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
        keymap("n", "<leader>lr", function() vim.lsp.buf.rename() end, { desc = "Rename current symbol" })
        keymap("n", "<leader>lR", function() vim.lsp.buf.references() end, { desc = "References of current symbol" })
        keymap('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end,
          { buffer = bufnr, desc = 'Format code' })

        -- setup telescope mappings if available
        if require('config.utils').is_available "telescope.nvim" then
          keymap("n", "gd", function() require("telescope.builtin").lsp_definitions() end,
            { desc = "Show the definition of current symbol", })
          keymap("n", "gy", function() require("telescope.builtin").lsp_type_definitions() end,
            { desc = "Definition of current type", })
          keymap("n", "gI", function() require("telescope.builtin").lsp_implementations() end,
            { desc = "Implementation of current symbol", })
          keymap("n", "gr", function() require("telescope.builtin").lsp_references() end,
            { desc = "References of current symbol", })
          keymap("n", "<leader>lR", function() require("telescope.builtin").lsp_references() end,
            { desc = "References of current symbol", })
          keymap("n", "<leader>lD", function() require("telescope.builtin").diagnostics() end,
            { desc = "Search diagnostics" })
          keymap("n", "<leader>lG", function()
            vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
              if query then
                -- word under cursor if given query is empty
                if query == "" then query = vim.fn.expand "<cword>" end
                require("telescope.builtin").lsp_workspace_symbols {
                  query = query,
                  prompt_title = ("Find word (%s)"):format(query),
                }
              end
            end)
          end, { desc = "Search workspace symbols" })
        end
      end

      --- The default LSP capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- for ufo
      capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true, }

      require("neoconf").setup {}
      require("neodev").setup {}

      local servers = require("servers.lsp")
      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local lsp_opts = { on_attach = on_attach, capabilities = capabilities }
            if servers[server_name] ~= nil and servers[server_name].opts ~= nil then
              lsp_opts = vim.tbl_deep_extend("force", servers[server_name].opts, lsp_opts)
            end
            require('lspconfig')[server_name].setup(lsp_opts)
          end,
        },
      }
    end,
  },


  {
    "j-hui/fidget.nvim",
    -- tag = "legacy",
    event = "VeryLazy",
    opts = {
      -- options
    },
  },

}

