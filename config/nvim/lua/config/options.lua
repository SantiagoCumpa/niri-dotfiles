vim.cmd([[set noswapfile]])

-- show numbers and set relative numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- better word finder
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
-- vim.opt.cmdheight = 0
vim.opt.fillchars = "eob: "
vim.o.pumborder = "single"
vim.o.pumheight = 15
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- show diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = " ●"
	},
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
	update_in_insert = false,
})

-- change dockerfiles type
vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
	},
})

local function remove_diagnostic_italics()
	local diagnostics = {
		"DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint", "DiagnosticOk",

		"DiagnosticVirtualTextError", "DiagnosticVirtualTextWarn",
		"DiagnosticVirtualTextInfo", "DiagnosticVirtualTextHint", "DiagnosticVirtualTextOk",

		"DiagnosticFloatingError", "DiagnosticFloatingWarn",
		"DiagnosticFloatingInfo", "DiagnosticFloatingHint", "DiagnosticFloatingOk",
	}

	for _, group in ipairs(diagnostics) do
		local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
		hl.italic = false
		vim.api.nvim_set_hl(0, group, hl)
	end
end

remove_diagnostic_italics()
-- Asegurar que se mantenga si el tema (colorscheme) se recarga
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = remove_diagnostic_italics,
})
