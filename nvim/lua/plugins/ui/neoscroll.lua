return {
  "karb94/neoscroll.nvim",
  event = buffer_with_content_events,
  opts = {},
  config = function()
    require("neoscroll").setup({
      duration_multiplier = 1.0,   -- Global duration multiplier
      easing = 'linear',           -- Default easing function
    })
  end
}
