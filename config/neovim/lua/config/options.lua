-- ═══════════════════════════════════════════════════════════════
--  🔥 Meru Cozy — Editor Options
-- ═══════════════════════════════════════════════════════════════

local opt = vim.opt

-- ── Appearance ──────────────────────────────────────────────
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.showmode = false
opt.pumblend = 12         -- popup transparency (glassmorphism vibes)
opt.winblend = 12         -- floating window transparency
opt.pumheight = 12        -- popup menu height
opt.laststatus = 3        -- global statusline
opt.fillchars = {
  foldopen = "v",
  foldclose = ">",
  fold = " ",
  foldsep = " ",
  diff = "/",
  eob = " ",              -- hide ~ at end of buffer
}
opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "␣",
}
opt.list = true

-- ── Indentation ─────────────────────────────────────────────
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.shiftround = true

-- ── Scrolling ───────────────────────────────────────────────
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.smoothscroll = true

-- ── Search ──────────────────────────────────────────────────
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- ── Splits ──────────────────────────────────────────────────
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- ── Editing ─────────────────────────────────────────────────
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.timeoutlen = 300
opt.confirm = true
opt.wrap = false
opt.linebreak = true
opt.mouse = "a"
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- ── Completion ──────────────────────────────────────────────
opt.completeopt = "menu,menuone,noselect"
opt.wildmode = "longest:full,full"

-- ── Font (for GUI clients like Neovide) ─────────────────────
opt.guifont = "JetBrainsMono Nerd Font:h11"

-- ── Fold ────────────────────────────────────────────────────
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- ── Grep ────────────────────────────────────────────────────
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
