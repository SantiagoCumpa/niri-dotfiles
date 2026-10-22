require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

require('mason-tool-installer').setup({
	ensure_installed = {
		'lua-language-server',
		'qmlls',
		{ 'gopls', condition = function() return vim.fn.executable('go') == 1 end },
		{ 'bash-language-server', condition = function() return vim.fn.executable('bun') == 1 end },
		'svelte-language-server',
		{ 'tailwindcss-language-server', condition = function() return vim.fn.executable('bun') == 1 end },
		{ 'typescript-language-server', condition = function() return vim.fn.executable('bun') == 1 end },
		{ 'yaml-language-server', condition = function() return vim.fn.executable('bun') == 1 end },
		{ 'biome', condition = function() return vim.fn.executable('bun') == 1 end },
		{ 'fish-lsp', condition = function() return vim.fn.executable('bun') == 1 end },
		{ 'html-lsp', condition = function() return vim.fn.executable('bun') == 1 end },
		{ 'json-lsp', condition = function() return vim.fn.executable('bun') == 1 end },
		'rust-analyzer',
		'clangd',
		'docker-language-server',
		'shellcheck',
		'tombi'
	},
	auto_update = true,
	run_on_start = true,
	debounce_hours = 5,
})
