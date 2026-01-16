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
        -- Vintage hacker explorer style
        Directory = { fg = "#00ff00" },
        SnacksExplorerDir = { fg = "#00ff00" },
        SnacksExplorerFile = { fg = "#00dd00" },
        SnacksExplorerPathHidden = { fg = "#006600" },
        SnacksExplorerNormal = { bg = "#000000", fg = "#00ff00" },
        SnacksPickerDir = { fg = "#00ff00" },
        SnacksPickerFile = { fg = "#00dd00" },
        SnacksPickerPathHidden = { fg = "#006600" },
        SnacksDashboardHeader = { fg = "#00ff00" },
        SnacksDashboardIcon = { fg = "#00aa00" },
        SnacksDashboardKey = { fg = "#00ff00" },
        SnacksDashboardDesc = { fg = "#00aa00" },
        NeoTreeDirectoryIcon = { fg = "#00ff00" },
        NeoTreeDirectoryName = { fg = "#00ff00" },
        NeoTreeFileName = { fg = "#00dd00" },
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
  -- Doom-One (Space theme - transparent with background image)
  {
    "NTBBloodbath/doom-one.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.doom_one_cursor_coloring = true
      vim.g.doom_one_terminal_colors = true
      vim.g.doom_one_italic_comments = false
      vim.g.doom_one_enable_treesitter = true
      vim.g.doom_one_diagnostics_text_color = true
      vim.g.doom_one_transparent_background = true

      vim.g.doom_one_pumblend_enable = true
      vim.g.doom_one_pumblend_transparency = 20

      vim.g.doom_one_plugin_neorg = false
      vim.g.doom_one_plugin_barbar = false
      vim.g.doom_one_plugin_telescope = true
      vim.g.doom_one_plugin_neogit = false
      vim.g.doom_one_plugin_nvim_tree = true
      vim.g.doom_one_plugin_dashboard = false
      vim.g.doom_one_plugin_startify = false
      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate = true
      vim.g.doom_one_plugin_lspsaga = false
    end,
  },
  -- Gruvbox alternative
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
    },
  },

  -- Theme toggle functionality
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      -- Theme toggle function (cycles through 3 themes)
      _G.toggle_theme = function()
        local current = vim.g.colors_name
        if current == "onedark" then
          vim.cmd.colorscheme("tokyonight")
          vim.notify("Switched to TokyoNight (LazyVim style)", vim.log.levels.INFO)
        elseif current == "tokyonight" or current:match("^tokyonight") then
          vim.cmd.colorscheme("doom-one")
          vim.notify("Switched to Doom-One (Space theme)", vim.log.levels.INFO)
        else
          require("onedark").load()
          vim.notify("Switched to OneDark (Hacker style)", vim.log.levels.INFO)
        end
      end
    end,
  },
}
