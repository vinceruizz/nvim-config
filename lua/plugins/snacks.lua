return {
  {
    "folke/snacks.nvim",
    init = function()
      vim.g.snacks_animate = false
    end,
    opts = {
      dashboard = { enabled = false },
      picker = {
        hidden = true,
        sources = {
          -- These define their own options, we must override their defaults.
          files = { hidden = true },
          buffers = { hidden = true },
          -- Explorer and the rest of the sources don't define their own opts
          -- so it will use the picker options defined above and we can choose
          -- to override them if desired.
          explorer = {
            ignored = true,
            -- If you prefer a right aligned explorer, uncomment this:
            -- layout = {
            --   layout = {
            --     position = "right",
            --   },
            -- },
          },
        },
      },
      terminal = {
        win = {
          position = "bottom",
          height = 0.3,
        },
      },
    },
    keys = {
      {
        "<leader>tt",
        function()
          Snacks.terminal.toggle(nil, { cwd = vim.fn.getcwd() })
        end,
        desc = "Toggle Terminal",
        mode = { "n", "t" },
      },
      {
        "<leader>th",
        function()
          local cwd = vim.fn.getcwd()
          Snacks.terminal.open(nil, {
            cwd = cwd,
            win = { position = "bottom", height = 0.3 },
          })
        end,
        desc = "Terminal Horizontal Split",
        mode = { "n" },
      },
      {
        "<leader>tv",
        function()
          local cwd = vim.fn.getcwd()
          Snacks.terminal.open(nil, {
            cwd = cwd,
            win = { position = "right", width = 0.4 },
          })
        end,
        desc = "Terminal Vertical Split",
        mode = { "n", "t" },
      },
      {
        "<leader>e",
        function()
          local explorers = Snacks.picker.get({ source = "explorer" })
          if #explorers > 0 then
            local explorer = explorers[1]
            if explorer:is_focused() then
              explorer:close()
            else
              explorer:focus()
            end
          else
            Snacks.picker.explorer()
          end
        end,
        desc = "Explorer",
      },
    },
  },
}