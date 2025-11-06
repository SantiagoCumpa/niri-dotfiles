return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "┌",
            left_bottom = "└",
            right_arrow = "─",
          },
        style = "#ffffff",
        delay = 200,
        duration = 100
      },
      indent = {
        enable = true,
      },
      line_num = {
        enable = true,
        style = "#ffffff",
      },
    })
  end
}
