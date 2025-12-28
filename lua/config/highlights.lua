return {
  -- Active window cues
  CursorLine = { bg = "#2a2d3a" }, -- subtle spotlight line
  CursorLineNr = { fg = "#7dd3fc", bold = true }, -- bright focus number

  -- Normal line numbers
  LineNr = { fg = "#6b7089" },

  -- Inactive window dimming
  LineNrNC = { fg = "#3f4458" },
  CursorLineNrNC = { fg = "#4b526a" },
  SignColumnNC = { fg = "#3f4458", bg = "NONE" },
  EndOfBufferNC = { fg = "#2b2f3f" },
  Cursor = {
    bg = "#7dd3fc",
    fg = "#0f1117",
  },
  -- Optional: make visual selection cursor also visible
  CursorInsert = {
    bg = "#67e8f9",
    fg = "#0f1117",
  },
}
