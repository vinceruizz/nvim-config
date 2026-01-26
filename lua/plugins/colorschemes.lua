return {
  -- OneDark with pure black background (hacker vibe)
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      style = "dark",
      transparent = false,
      term_colors = true,
      code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      colors = {
        bg0 = "#000000",
        bg1 = "#0a0a0a",
        bg2 = "#111111",
        bg3 = "#1a1a1a",
        bg_d = "#000000",
      },
      highlights = {
        Normal = { bg = "#000000" },
        NormalFloat = { bg = "#0a0a0a" },
        SignColumn = { bg = "#000000" },
        CursorLine = { bg = "#0a0a0a" },
        CursorLineNr = { fg = "#00ff00" },
        LineNr = { fg = "#00aa00" },
        VertSplit = { fg = "#00aa00" },
        WinSeparator = { fg = "#00aa00" },
        Pmenu = { bg = "#0a0a0a" },
        PmenuSel = { bg = "#1a1a1a", fg = "#00ff00" },
        FloatBorder = { bg = "#0a0a0a", fg = "#00aa00" },
        StatusLine = { bg = "#0a0a0a", fg = "#00ff00" },
        StatusLineNC = { bg = "#000000", fg = "#00aa00" },
        -- Vintage hacker explorer style (bright green)
        Directory = { fg = "#00ff00" },
        SnacksExplorerDir = { fg = "#00ff00" },
        SnacksExplorerFile = { fg = "#44ff44" },
        SnacksExplorerPathHidden = { fg = "#00bb00" },
        SnacksExplorerNormal = { bg = "#000000", fg = "#00ff00" },
        SnacksPickerDir = { fg = "#00ff00" },
        SnacksPickerFile = { fg = "#44ff44" },
        SnacksPickerPathHidden = { fg = "#00bb00" },
        SnacksDashboardHeader = { fg = "#00ff00" },
        SnacksDashboardIcon = { fg = "#44ff44" },
        SnacksDashboardKey = { fg = "#00ff00" },
        SnacksDashboardDesc = { fg = "#44ff44" },
        NeoTreeDirectoryIcon = { fg = "#00ff00" },
        NeoTreeDirectoryName = { fg = "#00ff00" },
        NeoTreeFileName = { fg = "#44ff44" },
        NeoTreeGitModified = { fg = "#ffaa00" },
        NeoTreeGitAdded = { fg = "#00ff00" },
        NeoTreeRootName = { fg = "#00ff00", bold = true },
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
    end,
  },
  -- TokyoNight (original LazyVim style)
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      style = "night",
      transparent = false,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_highlights = function(hl, c)
        hl.SnacksPickerPathHidden = { fg = c.comment }
        hl.SnacksPickerDir = { fg = c.comment }
      end,
    },
  },
  -- Gruvbox Hacker (pure black background with green UI, Gruvbox syntax)
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      contrast = "hard",
      transparent_mode = false,
      bold = true,
      overrides = {
        -- Pure black backgrounds
        Normal = { bg = "#000000" },
        NormalFloat = { bg = "#0a0a0a" },
        SignColumn = { bg = "#000000" },
        CursorLine = { bg = "#1a1a1a" },
        -- Green hacker UI elements
        CursorLineNr = { fg = "#00ff00", bold = true },
        LineNr = { fg = "#00aa00" },
        VertSplit = { fg = "#00aa00" },
        WinSeparator = { fg = "#00aa00" },
        Pmenu = { bg = "#0a0a0a" },
        PmenuSel = { bg = "#1a1a1a", fg = "#00ff00" },
        FloatBorder = { bg = "#0a0a0a", fg = "#00aa00" },
        StatusLine = { bg = "#0a0a0a", fg = "#00ff00" },
        StatusLineNC = { bg = "#000000", fg = "#00aa00" },
        -- Hacker explorer style (bright green)
        Directory = { fg = "#00ff00" },
        SnacksExplorerDir = { fg = "#00ff00" },
        SnacksExplorerFile = { fg = "#44ff44" },
        SnacksExplorerPathHidden = { fg = "#00bb00" },
        SnacksExplorerNormal = { bg = "#000000", fg = "#00ff00" },
        SnacksPickerDir = { fg = "#00ff00" },
        SnacksPickerFile = { fg = "#44ff44" },
        SnacksPickerPathHidden = { fg = "#00bb00" },
        SnacksDashboardHeader = { fg = "#00ff00" },
        SnacksDashboardIcon = { fg = "#44ff44" },
        SnacksDashboardKey = { fg = "#00ff00" },
        SnacksDashboardDesc = { fg = "#44ff44" },
        NeoTreeDirectoryIcon = { fg = "#00ff00" },
        NeoTreeDirectoryName = { fg = "#00ff00" },
        NeoTreeFileName = { fg = "#44ff44" },
        NeoTreeGitModified = { fg = "#ffaa00" },
        NeoTreeGitAdded = { fg = "#00ff00" },
        NeoTreeRootName = { fg = "#00ff00", bold = true },
      },
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
    end,
  },
  -- Nord (matching Kitty Nord theme - blue, white, yellow, green)
  {
    "shaunsingh/nord.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_bold = true

      require("nord").set()

      -- Nord color palette
      local frost_cyan = "#88c0d0"    -- primary blue
      local frost_blue = "#81a1c1"    -- secondary blue
      local frost_teal = "#8fbcbb"    -- teal accent
      local aurora_green = "#a3be8c"  -- green
      local aurora_yellow = "#ebcb8b" -- yellow
      local aurora_red = "#bf616a"    -- red
      local aurora_purple = "#b48ead" -- purple
      local snow_white = "#d8dee9"    -- primary white
      local snow_bright = "#eceff4"   -- bright white
      local polar_dark = "#1d2128"    -- darkest (matches Kitty)
      local polar_darker = "#242933"  -- slightly lighter
      local polar_mid = "#2e3440"     -- mid tone
      local muted = "#616e88"         -- readable muted text

      -- UI backgrounds (dark to match Kitty)
      vim.api.nvim_set_hl(0, "Normal", { bg = polar_dark, fg = snow_white })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = polar_darker })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = polar_dark })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = polar_darker })
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = aurora_yellow, bold = true })
      vim.api.nvim_set_hl(0, "LineNr", { fg = muted })
      vim.api.nvim_set_hl(0, "VertSplit", { fg = polar_mid })
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = polar_mid })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = polar_darker })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = polar_mid, fg = frost_cyan })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = polar_darker, fg = polar_mid })
      vim.api.nvim_set_hl(0, "StatusLine", { bg = polar_darker, fg = frost_cyan })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = polar_dark, fg = muted })

      -- Syntax highlighting with blue, white, yellow, green emphasis
      vim.api.nvim_set_hl(0, "Keyword", { fg = frost_blue, bold = true })
      vim.api.nvim_set_hl(0, "Statement", { fg = frost_blue, bold = true })
      vim.api.nvim_set_hl(0, "Conditional", { fg = frost_blue, bold = true })
      vim.api.nvim_set_hl(0, "Repeat", { fg = frost_blue, bold = true })
      vim.api.nvim_set_hl(0, "Function", { fg = frost_cyan, bold = true })
      vim.api.nvim_set_hl(0, "String", { fg = aurora_green })
      vim.api.nvim_set_hl(0, "Number", { fg = aurora_yellow })
      vim.api.nvim_set_hl(0, "Boolean", { fg = aurora_yellow })
      vim.api.nvim_set_hl(0, "Type", { fg = frost_teal })
      vim.api.nvim_set_hl(0, "Identifier", { fg = snow_white })
      vim.api.nvim_set_hl(0, "Comment", { fg = muted })
      vim.api.nvim_set_hl(0, "Operator", { fg = frost_cyan })
      vim.api.nvim_set_hl(0, "Special", { fg = aurora_yellow })
      vim.api.nvim_set_hl(0, "PreProc", { fg = aurora_green })
      vim.api.nvim_set_hl(0, "Constant", { fg = aurora_yellow })

      -- Treesitter highlights
      vim.api.nvim_set_hl(0, "@keyword", { fg = frost_blue, bold = true })
      vim.api.nvim_set_hl(0, "@function", { fg = frost_cyan, bold = true })
      vim.api.nvim_set_hl(0, "@function.call", { fg = frost_cyan })
      vim.api.nvim_set_hl(0, "@method", { fg = frost_cyan })
      vim.api.nvim_set_hl(0, "@string", { fg = aurora_green })
      vim.api.nvim_set_hl(0, "@number", { fg = aurora_yellow })
      vim.api.nvim_set_hl(0, "@boolean", { fg = aurora_yellow })
      vim.api.nvim_set_hl(0, "@type", { fg = frost_teal })
      vim.api.nvim_set_hl(0, "@variable", { fg = snow_white })
      vim.api.nvim_set_hl(0, "@property", { fg = snow_white })
      vim.api.nvim_set_hl(0, "@parameter", { fg = snow_bright })
      vim.api.nvim_set_hl(0, "@punctuation", { fg = snow_white })
      vim.api.nvim_set_hl(0, "@operator", { fg = frost_cyan })
      vim.api.nvim_set_hl(0, "@comment", { fg = muted })

      -- Explorer/picker with frost cyan
      vim.api.nvim_set_hl(0, "Directory", { fg = frost_cyan })
      vim.api.nvim_set_hl(0, "SnacksExplorerDir", { fg = frost_cyan })
      vim.api.nvim_set_hl(0, "SnacksExplorerFile", { fg = snow_white })
      vim.api.nvim_set_hl(0, "SnacksExplorerPathHidden", { fg = muted })
      vim.api.nvim_set_hl(0, "SnacksExplorerNormal", { bg = polar_dark, fg = frost_cyan })
      vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = frost_cyan })
      vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = snow_white })
      vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = muted })
      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = frost_cyan, bold = true })
      vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = aurora_green })
      vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = aurora_yellow })
      vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = snow_white })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = frost_cyan })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = frost_cyan })
      vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = snow_white })
      vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = aurora_yellow })
      vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = aurora_green })
      vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = frost_cyan, bold = true })
    end,
  },

  -- Theme toggle functionality
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      -- Theme toggle function (cycles through 3 themes)
      _G.toggle_theme = function()
        local current = vim.g.colors_name
        if current == "gruvbox" then
          vim.cmd.colorscheme("nord")
          vim.notify("Switched to Nord (Hacker Nord style)", vim.log.levels.INFO)
        elseif current == "nord" then
          vim.cmd.colorscheme("tokyonight")
          vim.notify("Switched to TokyoNight (LazyVim style)", vim.log.levels.INFO)
        else
          vim.cmd.colorscheme("gruvbox")
          vim.notify("Switched to Gruvbox (Hacker style)", vim.log.levels.INFO)
        end
      end
    end,
  },
}
