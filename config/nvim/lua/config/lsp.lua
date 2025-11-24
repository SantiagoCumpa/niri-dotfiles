local function start_lsp(filetype, opts)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = function(args)
			vim.lsp.start(
				vim.tbl_extend("keep", opts, { root_dir = vim.fs.root(0, opts.root_markers), bufnr = args.buf })
			)
		end,
	})
end

local servers = {
	"lua_ls",
	"typescript_ls",
	"python_ls",
	"rust_ls",
	"docker_ls",
	"compose_ls",
	"css_ls",
	"html_ls",
	"eslint_ls",
	"json_ls",
	"c_ls",
	"sql_ls",
	"fish_ls",
	"bash_ls",
	"yaml_ls",
	"toml_ls",
}

local function get_capabilities()
	-- Check if blink.cmp is available
	local has_blink, blink = pcall(require, "blink.cmp")

	if has_blink and blink.get_lsp_capabilities then
		-- Merge default capabilities with blink.cmp capabilities
		return vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities(), {
			-- Additional capabilities can be added here
			workspace = {
				fileOperations = {
					didRename = true,
					willRename = true,
				},
			},
		})
	else
		-- Fallback to default capabilities if blink.cmp is not available
		return vim.lsp.protocol.make_client_capabilities()
	end
end

local capabilities = get_capabilities()

for _, server_name in ipairs(servers) do
	-- Load server-specific config from lsp/<server-name>.lua
	local config_path = vim.fn.stdpath("config") .. "/lsp/" .. server_name .. ".lua"

	local ok, server_config

	if vim.fn.filereadable(config_path) == 1 then
		ok, server_config = pcall(dofile, config_path)
	end

	if not ok or type(server_config) ~= "table" then
		vim.notify(string.format("Failed to load config for %s, using defaults", server_name), vim.log.levels.WARN)
		server_config = {}
	end

	-- Attach capabilities
	server_config.capabilities = vim.tbl_deep_extend("force", capabilities, server_config.capabilities or {})

	if server_config.filetypes then
		start_lsp(server_config.filetypes, server_config)
	else
		vim.notify(string.format("Server %s has no filetypes defined", server_name), vim.log.levels.WARN)
	end
end

-- COPILOT_LSP
start_lsp({ "*" }, {
	name = "copilot_lsp",
	cmd = { "copilot-language-server", "--stdio" },
	root_markers = { ".git" },
})
