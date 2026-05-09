-- ═══════════════════════════════════════════════════════════════
--  🔥 Meru Cozy — UI Plugin Configs
--  Lualine, Dashboard, Noice, Indent guides
-- ═══════════════════════════════════════════════════════════════

local p = {
  bg_dark    = "#1a0e10",
  bg         = "#211316",
  bg_light   = "#2b1518",
  surface    = "#3d1e22",
  overlay    = "#4a2428",
  muted      = "#5a3a30",
  subtle     = "#6e5040",
  fg_dim     = "#a89080",
  fg         = "#e8dcd0",
  red        = "#843727",
  red_bright = "#c53a3a",
  mag_bright = "#b84545",
  amber      = "#c56d3a",
  gold       = "#e8a04a",
  teal       = "#0b596c",
  teal_br    = "#1a7a8a",
  blue_br    = "#3c608b",
  cyan       = "#7c94bc",
}

-- ── Lualine Meru theme ──────────────────────────────────────
local meru_lualine = {
  normal = {
    a = { fg = p.bg_dark, bg = p.amber, gui = "bold" },
    b = { fg = p.fg, bg = p.surface },
    c = { fg = p.fg_dim, bg = p.bg_light },
  },
  insert = {
    a = { fg = p.bg_dark, bg = p.teal, gui = "bold" },
    b = { fg = p.fg, bg = p.surface },
    c = { fg = p.fg_dim, bg = p.bg_light },
  },
  visual = {
    a = { fg = p.bg_dark, bg = p.mag_bright, gui = "bold" },
    b = { fg = p.fg, bg = p.surface },
    c = { fg = p.fg_dim, bg = p.bg_light },
  },
  replace = {
    a = { fg = p.bg_dark, bg = p.red_bright, gui = "bold" },
    b = { fg = p.fg, bg = p.surface },
    c = { fg = p.fg_dim, bg = p.bg_light },
  },
  command = {
    a = { fg = p.bg_dark, bg = p.gold, gui = "bold" },
    b = { fg = p.fg, bg = p.surface },
    c = { fg = p.fg_dim, bg = p.bg_light },
  },
  inactive = {
    a = { fg = p.muted, bg = p.bg },
    b = { fg = p.muted, bg = p.bg },
    c = { fg = p.muted, bg = p.bg },
  },
}

return {
  -- ── Lualine ─────────────────────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        theme = meru_lualine,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      })
      opts.sections = vim.tbl_deep_extend("force", opts.sections or {}, {
        lualine_a = { { "mode", icon = "🔥" } },
        lualine_b = {
          { "branch", icon = "" },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            diff_color = {
              added = { fg = p.teal },
              modified = { fg = p.amber },
              removed = { fg = p.red_bright },
            },
          },
        },
        lualine_c = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = " ●", readonly = " 󰌾", unnamed = " [No Name]" } },
        },
        lualine_x = {
          {
            function()
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if #clients == 0 then return "" end
              local names = {}
              for _, client in ipairs(clients) do
                table.insert(names, client.name)
              end
              return "󰒋 " .. table.concat(names, ", ")
            end,
            color = { fg = p.subtle },
          },
        },
        lualine_y = {
          { "encoding", color = { fg = p.fg_dim } },
          { "fileformat", color = { fg = p.fg_dim } },
        },
        lualine_z = {
          { "location" },
          { "progress" },
        },
      })
    end,
  },

  -- ── Dashboard (snacks.nvim) ─────────────────────────────────
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            [[                                                          ]],
            [[          ╱╲                                   ╱╲         ]],
            [[         ╱██╲                                 ╱██╲        ]],
            [[        ╱████╲                               ╱████╲       ]],
            [[       ╱██████╲─────────────────────────────╱██████╲      ]],
            [[      ╱░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░╲     ]],
            [[      ║░░                                        ░░║     ]],
            [[      ║░░  ███╗   ███╗███████╗██████╗ ██╗   ██╗  ░░║     ]],
            [[      ║░░  ████╗ ████║██╔════╝██╔══██╗██║   ██║  ░░║     ]],
            [[      ║░░  ██╔████╔██║█████╗  ██████╔╝██║   ██║  ░░║     ]],
            [[      ║░░  ██║╚██╔╝██║██╔══╝  ██╔══██╗██║   ██║  ░░║     ]],
            [[      ║░░  ██║ ╚═╝ ██║███████╗██║  ██║╚██████╔╝  ░░║     ]],
            [[      ║░░  ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ░░║     ]],
            [[      ║░░                                        ░░║     ]],
            [[      ║░░    ██████╗ ██████╗ ███████╗██╗   ██╗   ░░║     ]],
            [[      ║░░   ██╔════╝██╔═══██╗╚══███╔╝╚██╗ ██╔╝   ░░║     ]],
            [[      ║░░   ██║     ██║   ██║  ███╔╝  ╚████╔╝    ░░║     ]],
            [[      ║░░   ██║     ██║   ██║ ███╔╝    ╚██╔╝     ░░║     ]],
            [[      ║░░   ╚██████╗╚██████╔╝███████╗   ██║      ░░║     ]],
            [[      ║░░    ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝      ░░║     ]],
            [[      ║░░                                        ░░║     ]],
            [[      ║░░     🔥 warm nights & feral code 🔥     ░░║     ]],
            [[      ║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║     ]],
            [[      ╚════════════════════════════════════════════╝     ]],
            [[                           ╲                             ]],
            [[                        ╭───╯                            ]],
            [[                       ╱                                 ]],
            [[                    ──◆                                  ]],
            [[                                                          ]],
          }, "\n"),
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
      -- Snacks indent
      indent = {
        enabled = true,
        char = "│",
        scope = { char = "│" },
      },
      -- Snacks notifier styling
      notifier = {
        enabled = true,
        style = "compact",
      },
    },
  },

  -- ── Noice ───────────────────────────────────────────────────
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline_popup",
        format = {
          cmdline = { icon = "🔥" },
          search_down = { icon = " ⌄" },
          search_up = { icon = " ⌃" },
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
  },

  -- ── Bufferline ──────────────────────────────────────────────
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "thin",
        indicator = { style = "underline" },
        diagnostics_indicator = function(_, _, diag)
          local icons = { error = " ", warning = " " }
          local ret = (diag.error and icons.error .. diag.error .. " " or "")
            .. (diag.warning and icons.warning .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "🔥 Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
      highlights = {
        fill = { bg = p.bg_dark },
        background = { fg = p.muted, bg = p.bg },
        buffer_selected = { fg = p.fg, bg = p.bg_dark, bold = true, italic = false },
        buffer_visible = { fg = p.fg_dim, bg = p.bg },
        close_button = { fg = p.muted, bg = p.bg },
        close_button_selected = { fg = p.red_bright, bg = p.bg_dark },
        close_button_visible = { fg = p.muted, bg = p.bg },
        indicator_selected = { fg = p.amber, bg = p.bg_dark },
        indicator_visible = { fg = p.overlay, bg = p.bg },
        modified = { fg = p.gold, bg = p.bg },
        modified_selected = { fg = p.gold, bg = p.bg_dark },
        separator = { fg = p.bg_dark, bg = p.bg },
        separator_selected = { fg = p.bg_dark, bg = p.bg_dark },
        tab = { fg = p.muted, bg = p.bg },
        tab_selected = { fg = p.fg, bg = p.bg_dark, bold = true },
        tab_separator = { fg = p.bg_dark, bg = p.bg },
        tab_separator_selected = { fg = p.amber, bg = p.bg_dark },
        tab_close = { fg = p.red_bright, bg = p.bg },
      },
    },
  },
}
