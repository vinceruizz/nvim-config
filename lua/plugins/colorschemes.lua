return {
  -- Tokyonight with pure black background for hacker vibe
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_colors = function(colors)
        -- Override background to pure black
        colors.bg = "#000000"
        colors.bg_dark = "#000000"
        colors.bg_float = "#0a0a0a"
        colors.bg_popup = "#0a0a0a"
        colors.bg_sidebar = "#000000"
        colors.bg_statusline = "#0a0a0a"
        colors.bg_highlight = "#111111"
      end,
      on_highlights = function(hl, c)
        -- UI tweaks for black background
        hl.CursorLine = { bg = "#0a0a0a" }
        hl.LineNr = { fg = c.dark3 }
        hl.CursorLineNr = { fg = c.orange }
        hl.VertSplit = { fg = "#1a1a1a" }
        hl.WinSeparator = { fg = "#1a1a1a" }
        hl.SignColumn = { bg = "#000000" }
        hl.NormalFloat = { bg = "#0a0a0a" }
        hl.FloatBorder = { fg = c.blue, bg = "#0a0a0a" }
        hl.Pmenu = { bg = "#0a0a0a" }
        hl.PmenuSel = { bg = "#1a1a1a" }

        -- Snacks picker
        hl.SnacksPickerPathHidden = { fg = c.comment }
        hl.SnacksPickerDir = { fg = c.comment }
        hl.SnacksPickerGitStatusIgnored = { fg = c.dark3 }
        hl.SnacksPickerGitStatusUntracked = { fg = c.dark3 }
      end,
    },
  },
  -- Keep other themes as alternatives
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
    },
  },
}
