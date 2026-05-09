-- ═══════════════════════════════════════════════════════════════
--  🔥 Meru Cozy — Editor Plugin Configs
--  Telescope, Neo-tree, Flash, Gitsigns
-- ═══════════════════════════════════════════════════════════════

return {
  -- ── Telescope ───────────────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = " 🔥 ",
        selection_caret = "  ",
        entry_prefix = "  ",
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        sorting_strategy = "ascending",
        winblend = 8,
        hidden = true,             -- show hidden/dotfiles
        file_ignore_patterns = {
          "node_modules",
          "%.git/",
          "target/",
          "dist/",
          "build/",
        },
      },
      pickers = {
        find_files = {
          hidden = true,           -- show dotfiles in find_files
        },
        live_grep = {
          additional_args = { "--hidden" },  -- grep in dotfiles too
        },
      },
    },
  },

  -- ── Neo-tree ────────────────────────────────────────────────
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- Override LazyVim's init to prevent auto-opening on directory
    init = function()
      -- Don't auto-open neo-tree, only open it manually with <leader>e
    end,
    opts = {
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        hijack_netrw_behavior = "disabled",  -- don't hijack directory opens
        filtered_items = {
          visible = true,           -- show filtered items as dimmed
          hide_dotfiles = false,    -- don't hide dotfiles
          hide_gitignored = false,  -- show gitignored too
          hide_by_name = {
            "node_modules",
            ".git",
          },
        },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        width = 32,
        mappings = {
          ["<space>"] = "none",
          ["H"] = "toggle_hidden",  -- quick toggle for dotfiles
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            added = "",
            modified = "",
            deleted = "✘",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
    },
  },

  -- ── Gitsigns ────────────────────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "eol",
      },
      current_line_blame_formatter = "   <author>, <author_time:%R> • <summary>",
    },
  },

  -- ── Flash ───────────────────────────────────────────────────
  {
    "folke/flash.nvim",
    opts = {
      label = {
        rainbow = { enabled = false },
      },
      modes = {
        search = { enabled = true },
        char = {
          jump_labels = true,
        },
      },
    },
  },

  -- ── Todo Comments ───────────────────────────────────────────
  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        FIX  = { icon = " ", color = "error" },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning" },
        PERF = { icon = "󰅒 ", color = "hint" },
        NOTE = { icon = "󰍨 ", color = "hint" },
        TEST = { icon = "⏲ ", color = "test" },
      },
      colors = {
        error   = { "#c53a3a" },
        warning = { "#e8a04a" },
        info    = { "#0b596c" },
        hint    = { "#7c94bc" },
        test    = { "#b84545" },
      },
    },
  },

  -- ── Which-key ───────────────────────────────────────────────
  {
    "folke/which-key.nvim",
    opts = {
      win = {
        border = "rounded",
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "🔥 ",
      },
    },
  },
}
