-- ═══════════════════════════════════════════════════════════════
--  🔥 Meru Cozy — Keymaps
-- ═══════════════════════════════════════════════════════════════

-- Most keymaps come from LazyVim defaults, these are extras
local map = vim.keymap.set

-- ── Better escape ───────────────────────────────────────────
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- ── Better movement ─────────────────────────────────────────
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- ── Window navigation (also handled by LazyVim) ────────────
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- ── Buffer navigation ───────────────────────────────────────
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- ── Stay centered ───────────────────────────────────────────
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
map("n", "n", "nzzzv", { desc = "Next search centered" })
map("n", "N", "Nzzzv", { desc = "Prev search centered" })

-- ── Better indenting ────────────────────────────────────────
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- ── Move lines ──────────────────────────────────────────────
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down", silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up", silent = true })

-- ── Quick save ──────────────────────────────────────────────
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- ── Clear search highlight ──────────────────────────────────
map("n", "<Esc>", "<cmd>noh<cr><esc>", { desc = "Clear hlsearch" })
