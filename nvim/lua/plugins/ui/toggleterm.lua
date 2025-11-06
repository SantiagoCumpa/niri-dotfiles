return {
  'akinsho/toggleterm.nvim', 
  version = "*", 
  opts = {

  },
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<C-l>]],
      shell = 'fish',
      direction = "float",
      float_opts = {
        border = "single",
        winblend = 0, 
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
  end
}
