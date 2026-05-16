local MiniIcons = require('mini.icons')

require("lualine").setup({
	options = {
		globalstatus = true,
		disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
		section_separators = { left = '', right = '' },
		component_separators = { left = '•', right = '•' },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"branch",
				icon = '',
				color = { fg = '#181825', bg = '#A6E3A1' }
			}
			, "diff"
		},
		lualine_c = {
			{
				"diagnostics",
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = " ",
				},
			},
			{
				"filename",
			},

		},
		lualine_x = {
			'fileformat',
			"encoding",
			{
				"filetype",
				-- fmt = function(str) return string.format('%s %s', MiniIcons.get('filetype', str), str) end
			},

		},
		lualine_y = { "filesize" },
		lualine_z = {
			"location"
		},
	},
})
