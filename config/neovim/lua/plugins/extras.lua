-- ═══════════════════════════════════════════════════════════════
--  🔥 Meru Cozy — Extra Aesthetic Plugins
-- ═══════════════════════════════════════════════════════════════

return {
  -- ── Zen Mode ────────────────────────────────────────────────
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "🔥 Zen Mode" },
    },
    opts = {
      window = {
        backdrop = 0.92,
        width = 100,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        twilight = { enabled = true },
        gitsigns = { enabled = false },
      },
    },
  },

  -- ── Twilight (dim inactive code) ────────────────────────────
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = {
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#a89080" },
        term_bg = "#1a0e10",
        inactive = false,
      },
      context = 10,
      treesitter = true,
    },
  },

  -- ── Colorizer (show hex colors inline) ──────────────────────
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        css = true,
        css_fn = true,
        mode = "background",
        tailwind = true,
        virtualtext = "■",
      },
    },
  },

  -- ── Render Markdown ─────────────────────────────────────────
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      heading = {
        icons = { "🔥 ", "✦ ", "◆ ", "● ", "○ ", "· " },
      },
    },
  },
}
