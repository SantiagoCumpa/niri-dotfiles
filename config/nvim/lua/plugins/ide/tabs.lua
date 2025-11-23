return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	version = "*",
	-- event = "VeryLazy",
	-- keys = {
	-- 	{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
	-- 	{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
	-- 	{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
	-- 	{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
	-- 	{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
	-- 	{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	-- },
	opts = {
		options = {
			indicator = {
				style = "underline",
			},
			numbers = function(opts)
				return string.format("%s", opts.raise(opts.ordinal))
			end,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_count, _level, diagnostics_dict, _context)
				local s = ""
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " " or (e == "warning" and " " or " ")
					s = s .. sym .. n .. " "
				end
				return s
			end,
			get_element_icon = function(element)
				local icons = require("mini.icons")

				-- get icon by file name first
				local text, hl = icons.get("extension", element.extension)

				if not text then
					text, hl = icons.get("file", element.filetype)
				end

				if not text then
					text, hl = "", "MiniIconsDefault"
				end
				--
				return text, hl
			end,
			offsets = {
				{
					filetype = "neo-tree",
					-- text = "File Explorer",
					text = " ",
					-- text = function()
					-- 	return vim.fn.getcwd()
					-- end,
					highlight = "Directory",
				},
			},
		},
	},
}
