vim.api.nvim_set_hl(0, 'GitBlame', { fg = '#54596E' })

local ns_id = vim.api.nvim_create_namespace("GitBlameInline")
local augroup = vim.api.nvim_create_augroup("GitBlameInlineGroup", { clear = true })

local function clear_blame()
	vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
end

local function format_time_ago(timestamp)
	local diff = os.time() - tonumber(timestamp)

	if diff < 60 then return "just now" end
	local function pluralize(value, unit)
		if value == 1 then
			return value .. " " .. unit .. " ago"
		else
			return value .. " " .. unit .. "s ago"
		end
	end

	if diff < 3600 then
		return pluralize(math.floor(diff / 60), "minute")
	elseif diff < 86400 then
		return pluralize(math.floor(diff / 3600), "hour")
	elseif diff < 604800 then
		return pluralize(math.floor(diff / 86400), "day")
	elseif diff < 2592000 then
		return pluralize(math.floor(diff / 604800), "week")
	elseif diff < 31536000 then
		return pluralize(math.floor(diff / 2592000), "month")
	else
		return pluralize(math.floor(diff / 31536000), "year")
	end
end

local function show_blame_inline()
	clear_blame()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = cursor[1]
	local file = vim.api.nvim_buf_get_name(bufnr)

	-- get git directory
	local git_root = vim.fs.root(bufnr, '.git')

	-- don't show if no info
	local line_text = vim.api.nvim_buf_get_lines(bufnr, line - 1, line, false)[1]
	if not line_text or line_text:match("^%s*$") then return end
	--	only support file buffer
	if file == "" or not vim.uv.fs_stat(file) then return end

	-- get git blame information
	vim.system({
			'git',
			'blame',
			'-L',
			string.format('%s,%s', line, line),
			'--porcelain',
			file },
		{ text = true, cwd = git_root },
		function(obj)
			if obj.code ~= 0 then return end

			local out = obj.stdout
			local author = out:match("\n?author (.-)\n")
			local author_time = out:match("\nauthor%-time (%d+)\n")

			if not author or not author_time or author == "Not Committed Yet" then return end

			local time_ago = format_time_ago(author_time)
			local virt_text = string.format("            %s, %s", author, time_ago)

			vim.schedule(function()
				if vim.api.nvim_get_current_buf() == bufnr and vim.api.nvim_win_get_cursor(0)[1] == line then
					pcall(vim.api.nvim_buf_set_extmark, bufnr, ns_id, line - 1, 0, {
						virt_text = { { virt_text, "GitBlame" } },
						virt_text_pos = "eol",
						hl_mode = "combine"
					})
				end
			end)
		end)
end

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	group = augroup,
	callback = show_blame_inline,
})
