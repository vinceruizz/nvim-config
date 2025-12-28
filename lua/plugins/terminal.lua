return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = false,
      start_in_insert = true,
      direction = "horizontal",
    })
  end,
}
