return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "basedpyright", "ts_ls" },

    
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      
      -- Python LSP configuration
      lspconfig.basedpyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "strict",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              
              -- Enable all type checking rules
              enableTypeIgnoreComments = true,
              reportGeneralTypeIssues = "warning",
              reportPropertyTypeMismatch = "warning",
              reportFunctionMemberAccess = "warning",
              reportMissingImports = "warning",
              reportMissingTypeStubs = "warning",
              reportMissingModuleSource = "warning",
              reportMissingParameterType = "warning",
              reportMissingTypeArgument = "warning",
              reportOptionalSubscript = "warning",
              reportOptionalMemberAccess = "warning",
              reportOptionalCall = "warning",
              reportOptionalIterable = "warning",
              reportOptionalContextManager = "warning",
              reportOptionalOperand = "warning",
              reportPrivateImportUsage = "warning",
              reportUnboundVariable = "warning",
              reportUnknownParameterType = "warning",
              reportUnknownArgumentType = "warning",
              reportUnknownLambdaType = "warning",
              reportUnknownMemberType = "warning",
              reportUnknownVariableType = "warning",
              reportUntypedBaseClass = "warning",
              reportUntypedClassDecorator = "warning",
              reportUntypedFunctionDecorator = "warning",
              reportUntypedNamedTuple = "warning",
              reportCallInDefaultInitializer = "warning",
              reportUnnecessaryCast = "warning",
              reportUnnecessaryComparison = "warning",
              reportUnnecessaryContains = "warning",
              reportUnnecessaryIsInstance = "warning",
              reportImportCycles = "warning",
              reportDuplicateImport = "warning",
              
              -- Performance optimizations
              indexing = true,
              stubPath = "./typings",
            }
          }
        },
      })

      -- Lua LSP configuration
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- TypeScript/JavaScript configuration
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
        root_dir = lspconfig.util.find_git_ancestor,
      })

      -- C language configuration (clangd)
      lspconfig.clangd.setup({
        capabilities = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp" }, -- Supported filetypes for clangd
        root_dir = lspconfig.util.find_git_ancestor,
      })

      -- Keymaps for LSP features
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find References" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
    end,
  },
}
