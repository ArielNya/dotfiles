-- ═══════════════════════════════════════════════════════════════
--  🔥 Meru Cozy — Autocommands
-- ═══════════════════════════════════════════════════════════════

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ── Highlight on yank (warm amber flash) ────────────────────
autocmd("TextYankPost", {
  group = augroup("meru_yank_highlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- ── Restore cursor position ────────────────────────────────
autocmd("BufReadPost", {
  group = augroup("meru_restore_cursor", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ── Auto-resize splits on window resize ─────────────────────
autocmd("VimResized", {
  group = augroup("meru_resize_splits", { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- ── Close some filetypes with q ─────────────────────────────
autocmd("FileType", {
  group = augroup("meru_close_with_q", { clear = true }),
  pattern = {
    "help",
    "lspinfo",
    "notify",
    "qf",
    "query",
    "startuptime",
    "checkhealth",
    "man",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- ── Trim trailing whitespace on save ────────────────────────
autocmd("BufWritePre", {
  group = augroup("meru_trim_whitespace", { clear = true }),
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- ── Auto-create parent dirs on save ─────────────────────────
autocmd("BufWritePre", {
  group = augroup("meru_auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
