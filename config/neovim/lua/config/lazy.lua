-- ═══════════════════════════════════════════════════════════════
--  🔥 Meru Cozy — Lazy.nvim Bootstrap + LazyVim
-- ═══════════════════════════════════════════════════════════════

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- LazyVim core
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "meru-cozy",
      },
    },

    -- ── Language Extras ─────────────────────────────────────
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },

    -- ── Formatting ──────────────────────────────────────────
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- ── Our plugins ─────────────────────────────────────────
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "meru-cozy", "habamax" } },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
    backdrop = 80,
  },
})
