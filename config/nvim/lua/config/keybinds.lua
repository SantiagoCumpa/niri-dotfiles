-- disable '\' <Leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- disable space move
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- autocompletion
map("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger autocompletion" })

-- LSP
-- format file
map('n', '<leader>lf', function() vim.lsp.buf.format(bufnr) end, { desc = "Format current file" })
map('n', '<leader>ld', function() vim.diagnostic.open_float() end, { desc = "Open float diagnostics" })

-- files
map('n', '<leader>e', function() if not MiniFiles.close() then MiniFiles.open() end end, { desc = "Open file explorer" })
map("n", "<leader>fg", function() MiniPick.builtin.grep_live({ tool = 'rg' }) end, { desc = "Search words" })
map("n", "<leader>fb", function() MiniPick.builtin.buffers() end, { desc = "Search buffers" })
map("n", "<leader>fh", function() MiniPick.builtin.help({ default_split = 'vertical' }) end, { desc = "Help" })
-- picker
map('n', '<leader>ff', function() MiniPick.builtin.files() end, { desc = "Find files" })
-- buffers
map("n", "<leader>bd", function() MiniBufremove.delete() end, { desc = "Close current buffer" })
map("n", "<leader>bD", function() MiniBufremove.wipeout() end, { desc = "Wipe current buffer" })
-- terminal
map({ 'n', 't' }, '<leader>tt', function() Snacks.terminal.toggle() end, { desc = 'Toggle terminal' })
map({ 't' }, '<leader>tn', function() Snacks.terminal.open() end, { desc = 'Open new terminal' })
-- map('t', '<leader>tc', function() Snacks.terminal.toggle() end, { desc = 'Open terminal' })
-- git
map('n', '<leader>gg', function() Snacks.terminal("lazygit") end, { desc = "Open lazygit" })
map("n", "<leader>gb", function() Snacks.git.blame_line() end, { desc = "Git blame line" })
map("n", "<leader>gf", function() Snacks.lazygit.log_file() end, { desc = "Git log" })
-- docker
map('n', '<leader>dd', function() Snacks.terminal("lazydocker") end, { desc = "Open Lazydocker" })
-- ui interface
map("n", "<leader>uz", function() Snacks.zen() end, { desc = "Toggle zen mode" })
map("n", "<leader>ud", function()
	if Snacks.dim.enabled then
		Snacks.dim.disable()
	else
		Snacks.dim.enable()
	end
end, { desc = "Toggle dim" })

-- sessions
map("n", "<leader>sd", function()
	MiniSessions.select('delete')
end, { desc = "Delete session" })
map("n", "<leader>ss", function() MiniSessions.select('read') end, { desc = "Read session" })
map("n", "<leader>sw", function() MiniSessions.select('write') end, { desc = "Save session (pick)" })
map("n", "<leader>sn", function()
	MiniSessions.write(
		MiniInput.get({ prompt = "Session name: " })
	)
end, { desc = "Save session (prompt)" })
