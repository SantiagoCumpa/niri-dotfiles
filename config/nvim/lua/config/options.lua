vim.cmd([[set noswapfile]])

-- Show numbers and set relative numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.o.laststatus = 3
vim.opt.cmdheight = 0
vim.opt.fillchars = "eob: "
vim.o.winborder = "single"

-- Show Diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "󰛩",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
	underline = true,
	severity_sort = true,
})

-- change docker-compose type file
vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
	},
})
