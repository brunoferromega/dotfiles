return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "j-hui/fidget.nvim" },
    { "folke/lazydev.nvim" },
    { "Hoffs/omnisharp-extended-lsp.nvim" },
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "vimls",
        "rust_analyzer",
        "taplo", -- TOML file formatter
        "clangd",
        "gopls",
        "ts_ls",
        "jdtls",
        "pylsp",
        "lemminx",
        "csharp_ls",
        "omnisharp",
      },
      automatic_installation = false,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local disable_diagnostics = function(_, _)
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
    end

    local disable_snippets = function(client_capabilities)
      client_capabilities.textDocument.completion.completionItem.snippetSupport = false
      return client_capabilities
    end

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

    lspconfig.vimls.setup({
      capabilities = capabilities,
    })

    lspconfig.rust_analyzer.setup({
      on_attach = function(client, _)
        --- Remove Semantic Highlighting
        -- client.server_capabilities.semanticTokensProvider = nil

        --- Remove Completions
        client.server_capabilities.completionProvider = false

        --- Remove Diagnostics
        -- disable_diagnostics(client, bufrn)
      end,
      capabibilites = disable_snippets(capabilities),
    })

    lspconfig.taplo.setup({
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      on_attach = function(client, bufrn)
        disable_diagnostics(client, bufrn)
      end,
      capabilities = capabilities,
    })

    lspconfig.jdtls.setup({
      capabilitis = capabilities,
    })

    lspconfig.clangd.setup({
      on_attach = function(client, bufrn)
        disable_diagnostics(client, bufrn)
      end,
      capabilities = capabilities,
    })

    lspconfig.pylsp.setup({
      capabilities = capabilities,
    })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.lemminx.setup({
      capabilities = capabilities,
    })

    local config = {
      handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
        ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
        ["textDocument/references"] = require('omnisharp_extended').references_handler,
        ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
      },
      capabilities = capabilities,
    }
    lspconfig.omnisharp.setup(config)
  end,
}
