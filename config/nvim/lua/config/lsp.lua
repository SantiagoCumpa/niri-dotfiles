local lsp_servers = {
	'lua',
	'typescript',
	'biome',
	'fish',
	'bash',
	'cpp',
	'json',
	'docker',
	'rust',
	'tailwind',
	'toml',
	'yaml'
}

local function start_lsp(servers)
	for _, server in ipairs(servers) do
		-- Directory folder: ~/.config/nvim/lua/lsp/<server>.lua
		local module_path = 'lsp.' .. server
		local success, error_msg = pcall(require, module_path)

		if success then
			vim.lsp.enable(server)
		else
			local msg = string.format("Error initializing LSP [%s]:\n%s", server, error_msg)
			vim.notify(msg, vim.log.levels.WARN, { title = "LSP Config" })
		end
	end
end

start_lsp(lsp_servers)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		-- AutoCompletion
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end

		if client then
			local msg = string.format("LSP Conectado: %s", client.name)
			vim.notify(msg, vim.log.levels.INFO, { title = "LSP Status" })
		end
	end,
})
