require("snacks").setup({
	animate = { enabled = true },
	dim = { enabled = true },
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
	words = { enabled = true },
	bufdelete = { enabled = true },
	quickfile = { enabled = true },
	indent = {
		enabled = true,
	},
	terminal = {
		win = {
			style = "float",
			border = "single",
		},
		shell = "fish"
	},
	debug = { enabled = true },
	statuscolumn = {
		enabled = true,
		foldd = {
			open = true,
		}
	},
	scroll = { enabled = true },
	zen = { enabled = true, toggles = { dim = false } },
})
