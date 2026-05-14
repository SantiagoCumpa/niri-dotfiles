require("snacks").setup({
  git = { enabled = true },
  image = {
    enable = true,
    doc = {
      inline = true,
      float = true,
      max_width = 80,
      max_height = 40,
    }
  },
  toggle = { enabled = true },
  words = { enabled = true },
  bufdelete = { enabled = true },
  indent = { enabled = true },
  terminal = {
    win = {
      style = "float",
      border = "single",
    },
    shell = "fish"
  },
  statuscolumn = {
    enabled = true,
    foldd = {
      open = true,
    }
  },
  zen = { enable = true, toggles = { dim = false } },
})
