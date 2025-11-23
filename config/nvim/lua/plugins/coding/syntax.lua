return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			-- Languages to install
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"python",
				"javascript",
				"typescript",
				"tsx",
				"jsx",
				"html",
				"css",
				"json",
				"bash",
				"c",
				"rust",
				"yaml",
				"dockerfile",
				"cpp",
				"fish",
				"markdown",
				"markdown_inline",
				"sql",
				"fish",
				"toml",
			},
			-- Automatically install missing parsers when entering buffer
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				semantic_tokens = true,
			},
		})
	end,
}
