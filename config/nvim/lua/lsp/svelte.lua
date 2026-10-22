vim.lsp.config('svelte_ls', {
	cmd = { 'svelteserver', '--stdio' },
	filetypes = { 'svelte' },
	settings = {
		typescript = {
			inlayHints = {
				parameterNames = {
					enabled = 'literals',
					suppressWhenArgumentMatchesName = true,
				},
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
	},
	root_markers = { "svelte.config.js", 'package.json', },
	workspace_required = true,
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd('BufWritePost', {
			group = vim.api.nvim_create_augroup('svelte_ls_ts_sync_' .. bufnr, { clear = true }),
			pattern = { '*.js', '*.ts' },
			callback = function(ctx)
				client:notify('$/onDidChangeTsOrJsFile', { uri = vim.uri_from_fname(ctx.match) })
			end,
		})
	end,
})

vim.lsp.enable('svelte_ls')
