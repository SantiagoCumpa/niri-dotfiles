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
				"prettier", -- JS/TS

				-- linters
				"flake8", -- Python
				"luacheck", -- Lua
				"eslint_d", -- JS/TS
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
