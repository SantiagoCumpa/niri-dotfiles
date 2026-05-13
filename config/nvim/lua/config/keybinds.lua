-- disable \ <Leader>
vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Snacks
vim.keymap.set('n', '<Leader>st', '<cmd>Snack.terminal()<cr>', { desc = 'Buscar archivos' })
