-- disable '\' <Leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable space move
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- autocompletion
vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger autocompletion" })

-- format file
vim.keymap.set('n', '<Leader>lf', function () vim.lsp.buf.format(bufnr) end, { desc = "Format current file"} )

-- Snacks
local snacks = require('snacks')
vim.keymap.set('n', '<Leader>lt', function() snacks.terminal() end, { desc = 'Open terminal' })
vim.keymap.set('n', '<Leader>lg', function() snacks.terminal("lazygit") end, { desc = "Open Lazygit" })
vim.keymap.set('n', '<Leader>ld', function() snacks.terminal("lazydocker") end, { desc = "Open Lazydocker" })



