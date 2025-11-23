local colors = {
	black = "#000000",
	gray0 = "#0b0b0b",
	gray1 = "#161616",
	gray2 = "#262626",
	gray3 = "#393939",
	gray4 = "#6f6f6f",
	gray5 = "#8d8d8d",
	gray6 = "#a8a8a8",
	gray7 = "#c6c6c6",
	gray8 = "#dde1e6",
	white = "#ffffff",
	yellow = "#e0e394",
	green = "#91e6a3",
	red = "#e090a1",
	blue = "#9bc2d4",
	orange = "#c9a785",
	fg = "#f2f4f8",
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local M = {}

function M.setup()
	-- UI
	hi("Normal", { fg = colors.fg, bg = colors.black })
	hi("NormalFloat", { fg = colors.fg, bg = colors.gray0 })
	hi("FloatBorder", { fg = colors.gray1, bg = colors.gray0 })

	hi("Cursor", { fg = colors.black, bg = colors.white })
	hi("CursorLine", { bg = colors.gray2 })
	hi("CursorColumn", { bg = colors.gray2 })

	hi("LineNr", { fg = colors.gray3 })
	hi("CursorLineNr", { fg = colors.gray8 })

	hi("Visual", { bg = colors.gray2 })

	hi("StatusLine", { fg = colors.fg, bg = colors.black })
	hi("StatusLineNC", { fg = colors.gray4, bg = colors.black })

	hi("VertSplit", { fg = colors.gray1 })
	hi("SignColumn", { bg = colors.black })

	hi("Pmenu", { fg = colors.fg, bg = colors.gray0 })
	hi("PmenuSel", { fg = colors.white, bg = colors.gray2 })
	hi("PmenuSbar", { bg = colors.gray1 })
	hi("PmenuThumb", { bg = colors.gray3 })

	hi("Search", { bg = "#c6c6c6", fg = colors.white })
	hi("IncSearch", { bg = colors.gray6, fg = colors.black })

	hi("MatchParen", { bg = colors.gray2 })

	hi("ColorColumn", { bg = colors.gray1 })
	hi("Whitespace", { fg = colors.gray1 })

	hi("Folded", { fg = colors.gray5, bg = colors.gray1 })
	hi("FoldColumn", { fg = colors.gray3, bg = colors.black })

	hi("ErrorMsg", { fg = colors.gray5 })
	hi("WarningMsg", { fg = colors.gray6 })
	hi("InfoMsg", { fg = colors.gray8 })

	hi("DiffAdd", { bg = colors.gray5 })
	hi("DiffDelete", { bg = colors.gray5 })
	hi("DiffChange", { bg = colors.gray2 })
	hi("DiffText", { bg = colors.gray2 })

	------------------------------------------------------------------------------
	-- Syntax (based on tokenColors)
	------------------------------------------------------------------------------

	hi("Comment", { fg = colors.gray4 })
	hi("Constant", { fg = colors.gray7 })
	hi("String", { fg = colors.gray6 })
	hi("Character", { fg = colors.gray6 })
	hi("Number", { fg = colors.gray7 })
	hi("Boolean", { fg = colors.white })
	hi("Float", { fg = colors.gray7 })
	hi("Identifier", { fg = colors.gray5 })
	hi("Function", { fg = colors.white, bold = true })
	hi("Variable", { fg = colors.white })
	hi("Statement", { fg = colors.gray8, italic = true })
	hi("Operator", { fg = colors.gray4 })
	hi("Keyword", { fg = colors.gray8, italic = true })
	hi("Special", { fg = colors.gray6 })
	hi("Conditional", { fg = colors.gray6 })
	hi("Label", { fg = colors.white })
	hi("Delimiter", { fg = colors.fg })
	hi("Repeat", { fg = colors.gray6 })
	hi("Exception", { fg = colors.gray7 })
	hi("Repeat", { fg = colors.gray6 })
	hi("Include", { fg = colors.gray6 })

	-- hi("PreProc", { fg = colors.gray6 })
	-- hi("Define", { fg = colors.gray6 })
	-- hi("Macro", { fg = colors.gray6 })

	local function link(from, to)
		vim.api.nvim_set_hl(0, from, { link = to })
	end

	link("TSProperty", "TSField")
	link("TSNumber", "Number")
	link("Folded", "Comment")
	link("TSFloat", "Number")
	link("NonText", "Comment")
	link("TSPunctSpecial", "TSPunctDelimiter")
	link("TSOperator", "Operator")
	link("TSRepeat", "Repeat")
	link("TSConstBuiltin", "TSVariableBuiltin")
	link("TelescopeNormal", "Normal")
	link("TSType", "Type")
	link("TSField", "Constant")
	link("TSParameter", "Constant")
	link("TSConstant", "Constant")
	link("TSFunction", "Function")
	link("Macro", "Function")
	link("Conditional", "Operator")
	link("TSParameterReference", "TSParameter")
	link("TSTag", "MyTag")
	link("Whitespace", "Comment")
	link("TSPunctBracket", "MyTag")
	link("TSKeyword", "Keyword")
	link("Repeat", "Conditional")
	link("TSLabel", "Type")
	link("TSTagDelimiter", "Type")
	link("TSFuncMacro", "Macro")
	link("TSComment", "Comment")
	link("TSConditional", "Conditional")
	link("Operator", "Keyword")
	link("TSString", "String")
	link("CursorLineNr", "Identifier")
	link("TSNamespace", "TSType")

	-- -------------------- --
	-- Neo-tree integration --
	-- -------------------- --

	-- Backgrounds
	hi("NeoTreeNormal", { fg = colors.fg, bg = colors.black })
	hi("NeoTreeNormalNC", { fg = colors.fg, bg = colors.black })
	hi("NeoTreeCursorLine", { bg = colors.gray3 })

	-- Directories and files
	hi("NeoTreeDirectoryName", { fg = colors.gray8 }) -- Directory names
	hi("NeoTreeDirectoryIcon", { fg = colors.gray6 }) -- Folder icons
	hi("NeoTreeFileName", { fg = colors.fg }) -- Regular files
	hi("NeoTreeRootName", { fg = colors.gray6, bold = true }) -- Root folder

	-- Git signs
	hi("NeoTreeGitAdded", { fg = colors.green }) -- Added files
	hi("NeoTreeGitModified", { fg = colors.yellow }) -- Modified files
	hi("NeoTreeGitDeleted", { fg = colors.red }) -- Deleted files
	hi("NeoTreeGitConflict", { fg = colors.orange }) -- Conflicts

	hi("NeoTreeGitUnstaged", { fg = colors.yellow })
	hi("NeoTreeGitStaged", { fg = colors.green })
	hi("NeoTreeGitUntracked", { fg = colors.blue })

	hi("NeoTreeFloatBorder", { link = "FloatBorder" })
	hi("NeoTreeFloatTitle", { link = "FloatTitle" })
	hi("NeoTreeTitleBar", { fg = colors.gray0, bg = colors.gray8 })

	-- Other UI elements
	hi("NeoTreeIndentMarker", { fg = colors.gray5 }) -- Indentation guides
	hi("NeoTreeExpander", { fg = colors.gray6 }) -- Expand/collapse arrows
	hi("NeoTreeSymbolicLinkTarget", { fg = colors.gray7 }) -- Symbolic links

	-- ------------------ --
	-- Snacks Integration --
	-- ------------------ --

	-- Snacks Core UI
	hi("SnacksNormal", { link = "Normal" })
	hi("SnacksWinBar", { link = "Title" })
	hi("SnacksBackdrop", { link = "FloatShadow" })
	hi("SnacksNormalNC", { link = "NormalFloat" })
	hi("SnacksWinBarNC", { link = "SnacksWinBar" })

	-- Snacks Notifier (Info / Warn / Debug / Error / Trace)
	hi("SnacksNotifierInfo", { fg = colors.gray8 })
	hi("SnacksNotifierIconInfo", { fg = colors.gray8 })
	hi("SnacksNotifierTitleInfo", { fg = colors.gray8, italic = true })
	hi("SnacksNotifierFooterInfo", { link = "DiagnosticInfo" })
	hi("SnacksNotifierBorderInfo", { fg = colors.gray8 })

	hi("SnacksNotifierWarn", { fg = colors.gray6 })
	hi("SnacksNotifierIconWarn", { fg = colors.gray6 })
	hi("SnacksNotifierTitleWarn", { fg = colors.gray6, italic = true })
	hi("SnacksNotifierFooterWarn", { link = "DiagnosticWarn" })
	hi("SnacksNotifierBorderWarn", { fg = colors.gray6 })

	hi("SnacksNotifierDebug", { fg = colors.gray7 })
	hi("SnacksNotifierIconDebug", { fg = colors.gray7 })
	hi("SnacksNotifierTitleDebug", { fg = colors.gray7, italic = true })
	hi("SnacksNotifierFooterDebug", { link = "DiagnosticHint" })
	hi("SnacksNotifierBorderDebug", { fg = colors.gray7 })

	hi("SnacksNotifierError", { fg = colors.gray4 })
	hi("SnacksNotifierIconError", { fg = colors.gray4 })
	hi("SnacksNotifierTitleError", { fg = colors.gray4, italic = true })
	hi("SnacksNotifierFooterError", { link = "DiagnosticError" })
	hi("SnacksNotifierBorderError", { fg = colors.gray4 })

	hi("SnacksNotifierTrace", { fg = colors.gray5 })
	hi("SnacksNotifierIconTrace", { fg = colors.gray5 })
	hi("SnacksNotifierTitleTrace", { fg = colors.gray5, italic = true })
	hi("SnacksNotifierFooterTrace", { link = "DiagnosticHint" })
	hi("SnacksNotifierBorderTrace", { fg = colors.gray5 })

	-- Snacks Dashboard
	hi("SnacksDashboardNormal", { link = "Normal" })
	hi("SnacksDashboardDesc", { fg = colors.gray8 })
	hi("SnacksDashboardFile", { fg = colors.white })
	hi("SnacksDashboardDir", { link = "NonText" })
	hi("SnacksDashboardFooter", { fg = colors.gray5, italic = true })
	hi("SnacksDashboardHeader", { fg = colors.gray8 })
	hi("SnacksDashboardIcon", { fg = colors.gray4, bold = true })
	hi("SnacksDashboardKey", { fg = colors.gray7 })
	hi("SnacksDashboardTerminal", { link = "SnacksDashboardNormal" })
	hi("SnacksDashboardSpecial", { fg = colors.white })
	hi("SnacksDashboardTitle", { link = "Title" })

	-- Indent guides
	hi("SnacksIndent", { fg = colors.gray1 })
	hi("SnacksIndentScope", { fg = colors.fg })

	-- Picker UI
	hi("SnacksPickerSelected", {
		fg = colors.gray7,
		bg = colors.gray2,
		bold = true,
	})

	hi("SnacksPickerMatch", { fg = colors.gray8 })

	hi("SnacksPicker", { link = "NormalFloat" })
	hi("SnacksPickerBorder", { link = "FloatBorder" })
	hi("SnacksPickerInputBorder", { link = "SnacksPickerBorder" })
	hi("SnacksPickerInput", { link = "NormalFloat" })
	hi("SnacksPickerPrompt", { fg = colors.gray7 })

	-- ----------------- --
	-- Noice Integration --
	-- ----------------- --

	-- Cmdline
	hi("NoiceCmdline", { fg = colors.fg })
	hi("NoiceCmdlineIcon", { fg = colors.gray7 })
	hi("NoiceCmdlineIconSearch", { fg = colors.gray6 })
	hi("NoiceCmdlinePopupBorder", { fg = colors.white })
	hi("NoiceCmdlinePopupBorderSearch", { fg = colors.gray6 })

	-- Confirm popup
	hi("NoiceConfirmBorder", { fg = colors.gray8 })

	-- Minimal status
	hi("NoiceMini", { fg = colors.gray4, blend = 0 })

	-- Progress UI
	hi("NoiceFormatProgressDone", {
		bg = colors.gray2,
		fg = colors.gray4,
	})

	hi("NoiceFormatProgressTodo", {
		bg = colors.gray1,
		fg = colors.gray4,
	})

	-- ------------------- --
	-- Trouble Integration --
	-- ------------------- --

	hi("TroubleText", { fg = colors.gray7 })

	hi("TroubleCount", {
		fg = colors.gray8,
		bg = colors.gray3,
	})

	hi("TroubleNormal", {
		fg = colors.fg,
		bg = colors.black,
	})

	-- -------------------- --
	-- WhichKey Integration --
	-- -------------------- --

	hi("WhichKey", { link = "NormalFloat" })
	hi("WhichKeyBorder", { link = "FloatBorder" })

	hi("WhichKeyGroup", { fg = colors.gray6 })
	hi("WhichKeySeparator", { fg = colors.gray3 })
	hi("WhichKeyDesc", { fg = colors.gray8 })
	hi("WhichKeyValue", { fg = colors.gray3 })

	-- ------------------------ --
	-- Modern Treesitter Syntax --
	-- ------------------------ --

	-- Keyword
	hi("@keyword", { fg = colors.gray7, italic = true, bold = true })
	hi("@keyword.operator", { fg = colors.gray7 })
	hi("@keyword.coroutine", { fg = colors.gray7, bold = true })
	hi("@keyword.function", { fg = colors.gray7, bold = true })
	hi("@keyword.operator", { fg = colors.gray7, bold = true })
	hi("@keyword.imports", { fg = colors.gray7, bold = true })
	hi("@keyword.type", { fg = colors.gray7, bold = true })
	hi("@keyword.modifier", { fg = colors.gray7, bold = true })
	hi("@keyword.repeat", { fg = colors.gray7, bold = true })
	hi("@keyword.return", { fg = colors.gray7, bold = true })
	hi("@keyword.exception", { fg = colors.gray7, bold = true })
	hi("@keyword.conditional", { fg = colors.gray7, bold = true })
	hi("@keyword.conditional.ternary", { fg = colors.gray7, bold = true })
	hi("@keyword.directive", { fg = colors.gray7, bold = true })
	hi("@keyword.diective.define", { fg = colors.gray7, bold = true })

	-- Functions
	hi("@function", { fg = colors.fg })
	hi("@function.builtin", { fg = colors.gray7, italic = true })
	hi("@function.call", { fg = colors.gray6, italic = true })
	hi("@function.method", { fg = colors.fg })

	-- Variables
	hi("@variable", { fg = colors.white })
	hi("@variable.builtin", { fg = colors.gray5, italic = true })
	hi("@variable.parameters", { fg = colors.gray5 })
	hi("@variable.parameter.builtin", { fg = colors.gray4 })
	hi("@variable.member", { fg = colors.gray5 })

	-- Constanst
	hi("@constant", { fg = colors.gray7 })
	hi("@constant.builtin", { fg = colors.gray4 })
	hi("@constant.macro", { fg = colors.gray4 })

	-- Types
	hi("@type", { fg = colors.gray6, bold = true })
	hi("@type.builtin", { fg = colors.gray7, bold = true })
	hi("@type.definition", { fg = colors.gray8, bold = true })

	hi("@property", { fg = colors.fg })
	hi("@field", { fg = colors.fg })

	-- Strings
	hi("@string", { fg = colors.gray6 })
	hi("@string.documentation", { fg = colors.gray4, bold = true })
	hi("@string.regex", { fg = colors.gray4, bold = true })
	hi("@string.escape", { fg = colors.gray4, bold = true })
	hi("@string.special", { fg = colors.gray4, bold = true })
	hi("@string.special.symbol", { fg = colors.gray4, bold = true })
	hi("@string.special.path", { fg = colors.gray4, bold = true })
	hi("@string.special.url", { fg = colors.white, underline = true })

	hi("@number", { fg = colors.gray7 }) -- numbers
	hi("@boolean", { fg = colors.white, bold = true }) -- booleans

	-- Comments
	hi("@comment", { fg = colors.gray5, italic = true })
	hi("@comment.documentation", { fg = colors.gray5, italic = true })
	hi("@comment.error", { fg = colors.gray5, italic = true })
	hi("@comment.warning", { fg = colors.gray5, italic = true })
	hi("@comment.todo", { fg = colors.gray5, italic = true })
	hi("@comment.note", { fg = colors.gray5, italic = true })

	-- Operator
	hi("@operator", { fg = colors.gray5 }) -- + - *

	-- Punctuation
	hi("@punctuation.special", { fg = colors.gray6 }) -- ${}
	hi("@punctuation.delimiter", { fg = colors.gray8 }) -- : , .
	hi("@punctuation.bracket", { fg = colors.white }) -- () {} []

	-- Modules or namespaces
	hi("@module", { fg = colors.gray6 })

	hi("@label", { fg = colors.gray6 })

	-- Semantic tokens from LSP can also use these groups:
	-- hi("@lsp.type.comment", { fg = colors.gray5, italic = true })
	-- hi("@lsp.type.variable", { fg = colors.white })
	-- hi("@lsp.type.property", { fg = colors.fg })
	-- hi("@lsp.type.function", { fg = colors.fg })
	-- hi("@lsp.type.method", { fg = colors.fg })
	-- hi("@lsp.type.keyword", { fg = colors.gray6 })
	-- hi("@lsp.type.namespace", { fg = colors.gray6 })
	-- hi("@lsp.type.parameter", { fg = colors.gray7, italic = true })
	--
end

return M
