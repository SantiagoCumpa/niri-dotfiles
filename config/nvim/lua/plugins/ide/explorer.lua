return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-mini/mini.icons",
	},
	lazy = false,
	opts = {
		source_selector = {
			winbar = true,
			content_layout = "center",
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_hidden = false,
			},
		},
		default_component_configs = {
			git_status = {
				symbols = {
					untracked = "",
				},
			},
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				provider = function(icon, node) -- setup a custom icon provider
					local text, hl
					local mini_icons = require("mini.icons")
					if node.type == "file" then -- if it's a file, set the text/hl
						text, hl = mini_icons.get("file", node.name)
					elseif node.type == "directory" then -- get directory icons
						text, hl = mini_icons.get("directory", node.name)
						-- only set the icon text if it is not expanded
						if node:is_expanded() then
							text = nil
						end
					end

					-- set the icon text/highlight only if it exists
					if text then
						icon.text = text
					end
					if hl then
						icon.highlight = hl
					end
				end,
			},
		},
	},
}
