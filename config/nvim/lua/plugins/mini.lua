-- animations
-- require("mini.animate").setup()

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
		{ mode = 'n', keys = '<Leader>' },
		{ mode = 'x', keys = '<Leader>' },

		{ mode = 'n', keys = 'g' }, { mode = 'x', keys = 'g' },
		{ mode = 'n', keys = "'" }, { mode = 'n', keys = '`' }, { mode = 'x', keys = "'" }, { mode = 'x', keys = '`' },
		{ mode = 'n', keys = '"' }, { mode = 'x', keys = '"' }, { mode = 'i', keys = '<C-r>' }, { mode = 'c', keys = '<C-r>' },
		{ mode = 'n', keys = '<C-w>' },
		{ mode = 'n', keys = 'z' }, { mode = 'x', keys = 'z' },
		{ mode = 'n', keys = '[' }, { mode = 'n', keys = ']' },
	},

	clues = {
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
		miniclue.gen_clues.square_brackets(), -- (Añadido recientemente al plugin)

		-- Definir nombres para tus propios grupos de atajos personalizados
		{ mode = 'n', keys = '<Leader>f', desc = '+Find (Búsqueda)' },
		{ mode = 'n', keys = '<Leader>g', desc = '+Git' },
		{ mode = 'n', keys = '<Leader>l', desc = '+LSP / Código' },
	},
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
	window = {
		border = "rounded"
	}
})

-- show spaces
require("mini.trailspace").setup()
