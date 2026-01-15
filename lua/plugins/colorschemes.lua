return {
  -- Vintage Hacker theme - custom green on black
  {
    "neanias/everforest-nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 0,
        italics = false,
        disable_italic_comments = true,
      })
    end,
  },
  -- Matrix/Hacker green theme
  {
    "ribru17/bamboo.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      style = "vulgaris",
      transparent = false,
      dim_inactive = false,
      code_style = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        strings = {},
        variables = {},
      },
      colors = {
        -- Override with hacker green palette
        bg0 = "#000000",
        bg1 = "#0a0a0a",
        bg2 = "#111111",
        bg3 = "#1a1a1a",
        fg = "#00ff00",
        green = "#00ff00",
        light_green = "#55ff55",
      },
      highlights = {
        -- Core UI - pure black background
        Normal = { fg = "#00ff00", bg = "#000000" },
        NormalFloat = { fg = "#00ff00", bg = "#0a0a0a" },
        SignColumn = { bg = "#000000" },
        LineNr = { fg = "#00aa00", bg = "#000000" },
        CursorLineNr = { fg = "#00ff00", bg = "#111111" },
        CursorLine = { bg = "#0a0a0a" },
        Visual = { bg = "#003300" },
        Pmenu = { fg = "#00ff00", bg = "#0a0a0a" },
        PmenuSel = { fg = "#000000", bg = "#00ff00" },
        StatusLine = { fg = "#00ff00", bg = "#111111" },
        StatusLineNC = { fg = "#00aa00", bg = "#0a0a0a" },
        VertSplit = { fg = "#00aa00", bg = "#000000" },
        WinSeparator = { fg = "#00aa00", bg = "#000000" },

        -- Syntax - green shades
        Comment = { fg = "#006600" },
        String = { fg = "#55ff55" },
        Number = { fg = "#00ffaa" },
        Keyword = { fg = "#00ff00", bold = true },
        Function = { fg = "#00ffaa" },
        Identifier = { fg = "#00dd00" },
        Type = { fg = "#00ff88" },
        Constant = { fg = "#55ff55" },
        Statement = { fg = "#00ff00" },
        PreProc = { fg = "#00ff66" },
        Special = { fg = "#00ffcc" },
        Operator = { fg = "#00ff00" },

        -- Diagnostics
        DiagnosticError = { fg = "#ff5555" },
        DiagnosticWarn = { fg = "#ffff55" },
        DiagnosticInfo = { fg = "#55ffff" },
        DiagnosticHint = { fg = "#55ff55" },

        -- Git
        DiffAdd = { fg = "#55ff55", bg = "#003300" },
        DiffChange = { fg = "#ffff55", bg = "#333300" },
        DiffDelete = { fg = "#ff5555", bg = "#330000" },

        -- Treesitter
        ["@variable"] = { fg = "#00dd00" },
        ["@function"] = { fg = "#00ffaa" },
        ["@function.call"] = { fg = "#00ffaa" },
        ["@keyword"] = { fg = "#00ff00", bold = true },
        ["@string"] = { fg = "#55ff55" },
        ["@comment"] = { fg = "#006600" },
        ["@type"] = { fg = "#00ff88" },
        ["@constant"] = { fg = "#55ff55" },
        ["@property"] = { fg = "#00dd00" },
        ["@parameter"] = { fg = "#00cc00" },
        ["@punctuation"] = { fg = "#00aa00" },
      },
    },
  },
  -- Keep other themes as fallbacks
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
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },
}
