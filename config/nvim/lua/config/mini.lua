require("mini.pairs").setup()
require("mini.snippets").setup()
require("mini.cmdline").setup({
  autocomplete = {
    enable = true,
    delay = 100, -- Ajusta el tiempo de espera en ms (0 es instantáneo)
    map_arrows = true, -- Mapea flechas para consistencia en wildmenu
  },
  autocorrect = {
    enable = true,
  },
  autopeek = {
    enable = true,
    n_context = 2, 
  },
})
require('mini.completion').setup()
require("mini.diff").setup()
require("mini.files").setup()

require("mini.animate").setup()
require("mini.icons").setup()

local miniclue = require('mini.clue')
miniclue.setup({
  -- 1. Definir los disparadores (triggers)
  triggers = {
    -- Disparadores para tu tecla Leader (en modo normal y visual)
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Disparadores para comandos nativos y de movimiento comunes
    { mode = 'n', keys = 'g' }, { mode = 'x', keys = 'g' },
    { mode = 'n', keys = "'" }, { mode = 'n', keys = '`' }, { mode = 'x', keys = "'" }, { mode = 'x', keys = '`' }, -- Marcas
    { mode = 'n', keys = '"' }, { mode = 'x', keys = '"' }, { mode = 'i', keys = '<C-r>' }, { mode = 'c', keys = '<C-r>' }, -- Registros
    { mode = 'n', keys = '<C-w>' }, -- Ventanas
    { mode = 'n', keys = 'z' }, { mode = 'x', keys = 'z' }, -- Folding
    { mode = 'n', keys = '[' }, { mode = 'n', keys = ']' }, -- Movimientos de corchetes
  },

  -- 2. Definir las pistas y agrupaciones (clues)
  clues = {
    -- Inyectar documentación automática para las funcionalidades nativas de Neovim
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

require('mini.cursorword').setup()
require("mini.hipatterns").setup({
	highlighters = {
    	-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    	fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    	hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    	todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    	note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    	-- Highlight hex color strings (`#rrggbb`) using that color
    	hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
  },
})
require('mini.notify').setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()



