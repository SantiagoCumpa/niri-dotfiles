-- catpputccin theme
vim.pack.add({ "https://github.com/catppuccin/nvim" })

-- lualine
vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' })

-- snacks
vim.pack.add({ "https://github.com/folke/snacks.nvim" })

-- mini.nvim
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- mason lsp + tools installer
vim.pack.add({ "https://github.com/mason-org/mason.nvim" })
vim.pack.add({ "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" })

-- nvim treesitter
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }
})

-- load plugins setup
require("plugins.catppuccin")
require("plugins.mini")
require("plugins.snacks")
require("plugins.lualine")
require("plugins.mason")
require("plugins.treesitter")
