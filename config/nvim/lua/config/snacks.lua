require("snacks").setup({
  git = { enabled = true },
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
  zen = { enable = true, toggles = { dim = false } },
})
