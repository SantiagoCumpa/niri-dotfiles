vim.lsp.config('go_ls', {
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork' },
	root_markers = { 'go.work', 'go.mod', },
	settings = {
		gopls = {
			gofumpt = true,
			staticcheck = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		}
	}
})
vim.lsp.enable('go_ls')
