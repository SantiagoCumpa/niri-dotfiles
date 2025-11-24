return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependecies = {
		"mason-org/mason.nvim",
	},
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- formatters
				"black",
				"isort", -- Python
				"stylua", -- Lua
				"prettierd",
				"prettier", -- JS/TS, CSS, HTML
				"yq", -- YAML/Json
				"clang-format", -- C/C++
				"shfmt", -- Bash
				"tombi", -- TOML

				-- LSP
				"pyright", -- Python
				"lua-language-server", -- Lua
				"vtsls", -- JS/TS
				"eslint-lsp", -- Eslint
				"rust-analyzer", -- Rust
				"docker-language-server", -- Dockerfile
				"docker-compose-language-service", -- Docker Compose
				"yaml-language-server", -- Yaml
				"copilot-language-server", -- Copilot
				"css-lsp", -- CSS
				"html-lsp", -- HTML
				"clangd", -- C/C++
				"json-lsp", -- Json
				"bash-language-server", -- Bash
				"fish-lsp", -- Fish

				-- dap
				"codelldb",
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
