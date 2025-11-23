local function reload_workspace(bufnr)
	local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "rust_analyzer" })
	for _, client in ipairs(clients) do
		vim.notify("Reloading Cargo Workspace")
		---@diagnostic disable-next-line:param-type-mismatch
		client:request("rust-analyzer/reloadWorkspace", nil, function(err)
			if err then
				error(tostring(err))
			end
			vim.notify("Cargo workspace reloaded")
		end, 0)
	end
end

local function is_library(fname)
	local user_home = vim.fs.normalize(vim.env.HOME)
	local cargo_home = os.getenv("CARGO_HOME") or user_home .. "/.cargo"
	local registry = cargo_home .. "/registry/src"
	local git_registry = cargo_home .. "/git/checkouts"

	local rustup_home = os.getenv("RUSTUP_HOME") or user_home .. "/.rustup"
	local toolchains = rustup_home .. "/toolchains"

	for _, item in ipairs({ toolchains, registry, git_registry }) do
		if vim.fs.relpath(item, fname) then
			local clients = vim.lsp.get_clients({ name = "rust_analyzer" })
			return #clients > 0 and clients[#clients].config.root_dir or nil
		end
	end
end

---@type vim.lsp.Config
return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = {
		"Cargo.toml",
		"Cargo.lock",
		".git",
	},
	capabilities = {
		experimental = {
			serverStatusNotification = true,
			commands = {
				commands = {
					"rust-analyzer.showReferences",
					"rust-analyzer.runSingle",
					"rust-analyzer.debugSingle",
				},
			},
		},
	},
	before_init = function(init_params, config)
		if config.settings and config.settings["rust-analyzer"] then
			init_params.initializationOptions = config.settings["rust-analyzer"]
		end
		---@param command table{ title: string, command: string, arguments: any[] }
		vim.lsp.commands["rust-analyzer.runSingle"] = function(command)
			local r = command.arguments[1]
			local cmd = { "cargo", unpack(r.args.cargoArgs) }
			if r.args.executableArgs and #r.args.executableArgs > 0 then
				vim.list_extend(cmd, { "--", unpack(r.args.executableArgs) })
			end

			local proc = vim.system(cmd, { cwd = r.args.cwd })

			local result = proc:wait()

			if result.code == 0 then
				vim.notify(result.stdout, vim.log.levels.INFO)
			else
				vim.notify(result.stderr, vim.log.levels.ERROR)
			end
		end
	end,
	on_attach = function(_, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "LspCargoReload", function()
			reload_workspace(bufnr)
		end, { desc = "Reload current cargo workspace" })
	end,
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
			diagnostics = {
				enable = true,
			},
		},
	},
}
