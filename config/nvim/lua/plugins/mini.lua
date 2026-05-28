-- icons
local MiniIcons = require("mini.icons")
MiniIcons.setup()
MiniIcons.tweak_lsp_kind()
MiniIcons.mock_nvim_web_devicons()

-- generate pairs {} [] <> "" ''
require("mini.pairs").setup()

-- cmdline helpers
require("mini.cmdline").setup()

-- completions
require('mini.completion').setup()
require('mini.snippets').setup()

-- git diff on buffers
require("mini.diff").setup({
	view = {
		style = 'sign',
		signs = { add = '󰐕', change = '~', delete = '󰍴' },
	},
})

-- file manager
require("mini.files").setup()


-- buffer tabs
require("mini.tabline").setup()

-- recent files
require("mini.pick").setup({
	options = {
		content_from_bottom = true,
	},
	window = {
		prompt_prefix = ' ~ '
	}
})
require("mini.visits").setup()

-- key helper
local miniclue = require('mini.clue')
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = { 'n', 'x' }, keys = '<Leader>' },
		-- `[` and `]` keys
		{ mode = 'n',          keys = '[' },
		{ mode = 'n',          keys = ']' },
		-- Built-in completion
		{ mode = 'i',          keys = '<C-x>' },
		-- `g` key
		{ mode = { 'n', 'x' }, keys = 'g' },
		-- Marks
		{ mode = { 'n', 'x' }, keys = "'" },
		{ mode = { 'n', 'x' }, keys = '`' },
		-- Registers
		{ mode = { 'n', 'x' }, keys = '"' },
		{ mode = { 'i', 'c' }, keys = '<C-r>' },
		-- Window commands
		{ mode = 'n',          keys = '<C-w>' },
		-- `z` key
		{ mode = { 'n', 'x' }, keys = 'z' },
	},

	clues = {
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
		miniclue.gen_clues.square_brackets(),

		-- custom keybinds
		{ mode = 'n', keys = '<leader>b', desc = 'Buffer' },
		{ mode = 'n', keys = '<leader>d', desc = 'Docker' },
		{ mode = 'n', keys = '<leader>f', desc = 'Find' },
		{ mode = 'n', keys = '<leader>l', desc = 'LSP' },
		{ mode = 'n', keys = '<leader>g', desc = 'Git' },
		{ mode = 'n', keys = '<leader>t', desc = 'Terminal' },
		{ mode = 'n', keys = '<leader>u', desc = 'UI' },
	},
	window = {
		delay = 250
	}
})

-- better words
require('mini.cursorword').setup()
require("mini.hipatterns").setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
		hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
		todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
		note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})

-- notifications
local MiniNotify = require('mini.notify')
MiniNotify.setup({
	content = {
		format = function(notif)
			local icons = {
				ERROR = "",
				WARN  = "",
				INFO  = "",
				DEBUG = "",
				TRACE = "",
			}
			local icon = icons[notif.level] or "󰍡"
			local min_width = 30
			local line_width = vim.fn.strdisplaywidth(notif.msg)
			local padding = " "

			if line_width < min_width then
				padding = string.rep(" ", min_width - line_width)
			end

			return string.format(" %s  %s%s", icon, notif.msg, padding)
		end
	},
})

-- show spaces
require("mini.trailspace").setup()
