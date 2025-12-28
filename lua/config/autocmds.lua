-- Filetypes/buftypes we do NOT want to touch
local skip_ft = {
  NvimTree = true,
  netrw = true,
  ["neo-tree"] = true,
  oil = true,
  TelescopePrompt = true,
  ["lazy"] = true,
  ["mason"] = true,
}

local skip_bt = {
  nofile = true,
  prompt = true,
  terminal = true,
  help = true,
  quickfix = true,
}

local function should_skip(win)
  local buf = vim.api.nvim_win_get_buf(win)
  local ft = vim.bo[buf].filetype
  local bt = vim.bo[buf].buftype
  return skip_ft[ft] or skip_bt[bt]
end

local function active_window(ev)
  local win = ev.win or vim.api.nvim_get_current_win()

  if should_skip(win) then
    -- Explorer (and other special windows): keep them clean
    vim.wo[win].cursorline = false
    vim.wo[win].number = false
    vim.wo[win].relativenumber = false
    return -- IMPORTANT: do NOT overwrite winhighlight
  end

  vim.wo[win].cursorline = true
  vim.wo[win].number = true
  vim.wo[win].relativenumber = true

  vim.wo[win].winhighlight = table.concat({
    "LineNr:LineNr",
    "CursorLineNr:CursorLineNr",
    "SignColumn:SignColumn",
    "EndOfBuffer:EndOfBuffer",
  }, ",")
end

local function inactive_window(ev)
  local win = ev.win or vim.api.nvim_get_current_win()

  if should_skip(win) then
    return -- leave explorer plugin’s highlighting alone
  end

  vim.wo[win].cursorline = false

  vim.wo[win].winhighlight = table.concat({
    "LineNr:LineNrNC",
    "CursorLineNr:CursorLineNrNC",
    "SignColumn:SignColumnNC",
    "EndOfBuffer:EndOfBufferNC",
  }, ",")
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  callback = active_window,
})

vim.api.nvim_create_autocmd("WinLeave", {
  callback = inactive_window,
})
