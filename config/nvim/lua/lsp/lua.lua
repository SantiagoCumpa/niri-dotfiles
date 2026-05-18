vim.lsp.config('lua_ls', {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.luarc.json', '.luarc.jsonc' },
	settings = {
		Lua = {
			codeLens = { enable = true },
			hint = { enable = true, semicolon = 'Disable' },
			diagnostics = {
				globals = { "vim" } -- Le dice al LSP que 'vim' existe
			}
		},
	}
})
vim.lsp.enable('lua_ls')
