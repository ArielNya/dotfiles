-- ═══════════════════════════════════════════════════════════════
--  🔥 Meru Cozy — Colorscheme Plugin Spec
-- ═══════════════════════════════════════════════════════════════

return {
  -- Disable default colorschemes that LazyVim might pull in
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },

  -- Our colorscheme is local (in colors/ dir), no plugin needed
  -- Just tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "meru-cozy",
    },
  },
}
