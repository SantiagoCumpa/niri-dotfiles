vim.lsp.config('qml_ls', {
	cmd = { 'qmlls6' },
	filetypes = { 'qml' },
	root_markers = { '.git' },
})
vim.lsp.enable('qml_ls')
