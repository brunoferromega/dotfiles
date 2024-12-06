return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- LSP Configuration
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      -- LSP Management
      -- https://github.com/williamboman/mason.nvim
      { "williamboman/mason.nvim" },
      -- https://github.com/williamboman/mason-lspconfig.nvim
      { "williamboman/mason-lspconfig.nvim" },

      -- Auto-Install LSPs, linters, formatters, debuggers
      -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },

      -- Useful status updates for LSP
      -- https://github.com/j-hui/fidget.nvim
      { "j-hui/fidget.nvim",                        opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      -- https://github.com/folke/neodev.nvim
      { "folke/neodev.nvim",                        opts = {} },
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "clangd",
          "csharp_ls",
          "gopls",
          "taplo",
          "elp",
          "jdtls",
          "ts_ls",
          "pylsp",
          "jsonls",
          "bashls",
          "cssls",
          "tailwindcss",
          "yamlls",
          "html",
          "dockerls",
          "docker_compose_language_service",
          "lemminx",
          "sqlls",
          "ruby_lsp",
          "rubocop",
          "ocamllsp",
          "clojure_lsp",
          "kotlin_language_server",
        },
        automatic_installation = true,
      })

      require("cmp").setup({
        completion = { autocomplete = false },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local html_capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
          },
        },
        capabilities = capabilities,
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      lspconfig.csharp_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })

      lspconfig.elp.setup({
        capabilities = capabilities,
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })

      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })

      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities,
      })

      lspconfig.html.setup({

        capabilities = html_capabilities,

        filetypes = { "html", "elixir", "eelixir", "html-eex", "heex", "templ" },

        init_options = {
          configurationSection = {
            "html",
            "css",
            "javascript",
          },
          embeddedLanguages = {
            html = true,
            css = true,
            javascript = true,
          },
          provideFormatter = true,
        },
      })

      lspconfig.vimls.setup({
        capabilities = capabilities,
      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })

      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
      })

      lspconfig.rubocop.setup({
        capabilities = capabilities,
      })

      lspconfig.ocamllsp.setup({
        capabilities = capabilities,
      })

      lspconfig.clojure_lsp.setup({
        capabilities = capabilities,
      })

      lspconfig.kotlin_language_server.setup({
        capabilities = capabilities,
      })

      lspconfig.taplo.setup({
        capabilities = capabilities,
      })
    end,
  },
}
