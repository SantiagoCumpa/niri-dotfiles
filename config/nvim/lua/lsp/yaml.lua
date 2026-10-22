vim.lsp.config('yaml_ls', {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
	root_markers = { '.git' },
	settings = {
		redhat = { telemetry = { enabled = false } },
		yaml = { format = { enable = true } },
	},
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = true
	end,
})
vim.lsp.enable('yaml_ls')
