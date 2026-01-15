return {
  -- OneDark with pure black background for hacker vibe
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
        -- Override background to pure black
        bg0 = "#000000",
        bg1 = "#0a0a0a",
        bg2 = "#111111",
        bg3 = "#1a1a1a",
        bg_d = "#000000",
      },
      highlights = {
        -- UI tweaks for black background
        Normal = { bg = "#000000" },
        NormalFloat = { bg = "#0a0a0a" },
        SignColumn = { bg = "#000000" },
        CursorLine = { bg = "#0a0a0a" },
        CursorLineNr = { fg = "#e5c07b" },
        LineNr = { fg = "#4b5263" },
        VertSplit = { fg = "#1a1a1a" },
        WinSeparator = { fg = "#1a1a1a" },
        Pmenu = { bg = "#0a0a0a" },
        PmenuSel = { bg = "#1a1a1a" },
        FloatBorder = { bg = "#0a0a0a" },
        StatusLine = { bg = "#0a0a0a" },
        StatusLineNC = { bg = "#000000" },
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },
  -- Keep other themes as alternatives
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = false,
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
    },
  },
}
