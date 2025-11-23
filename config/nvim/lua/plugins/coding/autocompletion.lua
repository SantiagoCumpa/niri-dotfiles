return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"nvim-mini/mini.icons",
		"onsails/lspkind.nvim",
		"rafamadriz/friendly-snippets",
	},
	version = "1.*",
	opts = {
		keymap = { preset = "super-tab" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			list = { selection = { auto_insert = false } },
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			ghost_text = { enabled = true },

			menu = {
				auto_show = false,
				max_height = 10,
				scrollbar = true,
				draw = {
					columns = { { "kind_icon" }, { "label" }, { "kind" } },
					components = {
						kind_icon = {
							text = function(ctx)
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local mini_icon, _ = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
									if mini_icon then
										return mini_icon .. ctx.icon_gap
									end
								end

								local icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
								return icon .. ctx.icon_gap
							end,

							highlight = function(ctx)
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local mini_icon, mini_hl =
										require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
									if mini_icon then
										return mini_hl
									end
								end
								return ctx.kind_hl
							end,
						},
						kind = {
							highlight = function(ctx)
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local mini_icon, mini_hl =
										require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
									if mini_icon then
										return mini_hl
									end
								end
								return ctx.kind_hl
							end,
						},
					},
				},
			},
		},
	},
}
