return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "elp",
          "jdtls",
          "tsserver",
          "pylsp",
          "jsonls",
          "rust_analyzer",
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
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("cmp").setup({
        completion = {
          autocomplete = false
        }
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local html_capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.elp.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
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
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
      lspconfig.kotlin_language_server.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
    end,
  },
}
