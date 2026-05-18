-- disable '\' <Leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map = vim.keymap.set

-- disable space move
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- autocompletion
map("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger autocompletion" })

-- format file
map('n', '<leader>lf', function() vim.lsp.buf.format(bufnr) end, { desc = "Format current file" })

-- Mini
-- files
map('n', '<leader>e', function() if not MiniFiles.close() then MiniFiles.open() end end, { desc = "Open file explorer" })
map("n", "<leader>fg", function() MiniPick.builtin.grep_live({ tool = 'rg' }) end, { desc = "Search words" })
map("n", "<leader>fb", function() MiniPick.builtin.buffers() end, { desc = "Search buffers" })
map("n", "<leader>fh", function() MiniPick.builtin.help({ default_split = 'vertical' }) end, { desc = "Help" })
-- picker
map('n', '<leader>ff', function() MiniPick.builtin.files() end, { desc = "Find files" })

-- Snacks
-- delete buffers
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Close current buffer" })
map("n", "<leader>bD", function() Snacks.bufdelete.all() end, { desc = "Close all buffers" })
-- terminal
map('n', '<leader>tt', function() Snacks.terminal() end, { desc = 'Open terminal' })
-- git
map('n', '<leader>gg', function() Snacks.terminal("lazygit") end, { desc = "Open lazygit" })
map("n", "<leader>gb", function() Snacks.git.blame_line() end, { desc = "Git blame line" })
map("n", "<leader>gf", function() Snacks.lazygit.log_file() end, { desc = "Git log" })
-- docker
map('n', '<leader>dd', function() Snacks.terminal("lazydocker") end, { desc = "Open Lazydocker" })
-- ui interface
map("n", "<leader>uz", function() Snacks.zen() end, { desc = "Toggle zen mode" })
map("n", "<leader>ud", function() Snacks.dim.enable() end, { desc = "Enable dim" })
map("n", "<leader>uD", function() Snacks.dim.disable() end, { desc = "Disable dim" })

