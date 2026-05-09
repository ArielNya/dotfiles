-- ═══════════════════════════════════════════════════════════════
--  🔥 Meru Cozy — Coding Plugin Configs
--  Treesitter, LSP, Completion (TS/HTML/CSS, Rust, C)
-- ═══════════════════════════════════════════════════════════════

return {
  -- ── Treesitter ──────────────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Web
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
        "scss",
        "json",
        "jsonc",
        -- Systems
        "rust",
        "c",
        "cpp",
        -- Config/scripting
        "lua",
        "luadoc",
        "bash",
        "toml",
        "yaml",
        "xml",
        -- Markup
        "markdown",
        "markdown_inline",
        -- Other
        "vim",
        "vimdoc",
        "query",
        "regex",
        "diff",
        "gitcommit",
        "git_rebase",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    },
  },

  -- ── LSP ─────────────────────────────────────────────────────
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰌵 ",
          },
        },
        float = {
          border = "rounded",
          source = true,
        },
      },
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = true,
      },
      -- Server-specific settings handled by LazyVim extras
      -- (typescript, rust-analyzer, clangd are pulled in via imports)
    },
  },

  -- ── Completion (blink.cmp or nvim-cmp depending on LazyVim version) ──
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      completion = {
        menu = {
          border = "rounded",
          winblend = 8,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },
          },
        },
        documentation = {
          window = {
            border = "rounded",
            winblend = 8,
          },
        },
        ghost_text = {
          enabled = true,
        },
      },
    },
  },

  -- Fallback for nvim-cmp if blink isn't used
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        }),
      }
    end,
  },

  -- ── Conform (formatting) ────────────────────────────────────
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        rust = { "rustfmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        lua = { "stylua" },
      },
    },
  },
}
