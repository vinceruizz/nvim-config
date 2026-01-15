-- Options are automatically loaded before lazy.nvim startup.
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Certain but not all LSPs will set the root directory based on which buffer
-- is active. This affects picking files. I found this to be disruptive, for
-- example editing a Lua file in my dotfiles prevented me from fuzzy finding
-- files of the nvim/ directory. Remove this to bring things back to LazyVim's
-- default behavior.
vim.g.root_spec = { "cwd" }

-- The ~/.local/state/nvim/lsp.log can get pretty noisy. Mine was ~28MB after 2
-- weeks with the default setting. My thought process here is it can remain OFF
-- by default but if you're looking to troubleshoot something you can
-- temporarily set this to WARN or ERROR.
vim.lsp.set_log_level("OFF")

local opt = vim.opt

-- I prefer seeing all characters by default.
opt.conceallevel = 0

-- Show a vertical line at this character.
opt.colorcolumn = "80"

-- Each buffer gets its own status line instead of sharing one.
opt.laststatus = 2

-- These are all invisible by default but we can toggle them with a keymap.
opt.listchars = {
	eol = "$",
	tab = ">-",
	trail = "-",
	lead = "-",
	extends = "~",
	precedes = "~",
	conceal = "+",
	nbsp = "&",
}
opt.list = false

-- Don't auto-scroll N number of lines from the top of the buffer.
opt.scrolloff = 0

-- Allow left and right arrow keys to move to the previous and next line.
opt.whichwrap = "b,s,<,>"

-- Wrap lines so it's easier to see anything that's cut off.
opt.wrap = true

-- Disable ColorColumn
vim.opt.colorcolumn = ""

-- Diagnostic configuration - less intrusive inline messages
vim.diagnostic.config({
  -- Disable inline virtual text (the annoying text at end of lines)
  virtual_text = false,
  -- Show signs in the gutter instead
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "●",
      [vim.diagnostic.severity.WARN] = "●",
      [vim.diagnostic.severity.HINT] = "●",
      [vim.diagnostic.severity.INFO] = "●",
    },
  },
  -- Underline problematic code
  underline = true,
  -- Update diagnostics in insert mode (set to false for less distraction)
  update_in_insert = false,
  -- Sort by severity
  severity_sort = true,
  -- Float window configuration (shown with <leader>cd or hover)
  float = {
    border = "rounded",
    source = true, -- Show which LSP generated the diagnostic
    header = "",
    prefix = "",
  },
})

-- Filter duplicate diagnostics from multiple LSPs
local function filter_diagnostics(diagnostics)
  local dominated = {}

  for i, d1 in ipairs(diagnostics) do
    if not dominated[i] then
      for j, d2 in ipairs(diagnostics) do
        if i ~= j and not dominated[j] and d1.lnum == d2.lnum then
          -- Normalize messages for comparison
          local m1 = d1.message:lower():gsub("[%p%s]", "")
          local m2 = d2.message:lower():gsub("[%p%s]", "")
          -- If messages are similar, keep the one with higher severity (lower number)
          if m1:find(m2, 1, true) or m2:find(m1, 1, true) or m1:sub(1, 30) == m2:sub(1, 30) then
            if d1.severity <= d2.severity then
              dominated[j] = true
            else
              dominated[i] = true
              break
            end
          end
        end
      end
    end
  end

  local filtered = {}
  for i, d in ipairs(diagnostics) do
    if not dominated[i] then
      table.insert(filtered, d)
    end
  end
  return filtered
end

-- Override the diagnostic handler to filter duplicates
local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  if result and result.diagnostics then
    result.diagnostics = filter_diagnostics(result.diagnostics)
  end
  orig_handler(err, result, ctx, config)
end
