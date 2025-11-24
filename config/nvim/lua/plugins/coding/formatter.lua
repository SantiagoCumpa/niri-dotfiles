return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			json = { "yq" },
			yaml = { "yq" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			bash = { "shfmt" },
			fish = { "fish_indent" },
			toml = { "tombi" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
