return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        cs = { "csharpier" },
        java = { "google-java-format" },
        sql = { "sql_formatter" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Python
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                ignore = { "*" },
              },
            },
          },
        },
        ruff = {},

        -- JavaScript/TypeScript
        ts_ls = {},
        eslint = {},

        -- C/C++
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },

        -- C#
        omnisharp = {
          cmd = { "omnisharp" },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },

        -- Java
        jdtls = {},

        -- SQL
        sqlls = {},

        -- HTML
        html = {},

        -- CSS
        cssls = {},

        -- Tailwind CSS
        tailwindcss = {},

        -- YAML
        yamlls = {
          settings = {
            yaml = {
              customTags = {
                "!And sequence",
                "!Base64",
                "!Cidr sequence",
                "!Equals sequence",
                "!FindInMap sequence",
                "!GetAZs",
                "!GetAtt",
                "!If sequence",
                "!ImportValue",
                "!Join sequence",
                "!Length sequence",
                "!Not sequence",
                "!Or sequence",
                "!Ref",
                "!Select sequence",
                "!Split sequence",
                "!Sub",
                "!Transform scalar",
              },
            },
          },
        },

        -- Bash
        bashls = {
          settings = {
            filetypes = { "sh", "bash", "zsh" },
          },
        },

        -- Disabled
        rubocop = {
          enabled = false,
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP servers
        "pyright",
        "ruff",
        "typescript-language-server",
        "eslint-lsp",
        "clangd",
        "omnisharp",
        "jdtls",
        "sqlls",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "yaml-language-server",
        "bash-language-server",
        -- Formatters
        "prettier",
        "clang-format",
        "csharpier",
        "google-java-format",
        "sql-formatter",
        -- Linters
        "eslint_d",
        "pylint",
      },
    },
  },
}
