-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	vim.notify("no saga", vim.log.levels.ERROR)
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
	},
	ui = {
		colors = {
			normal_bg = "#022746",
		},
		-- setting ui icon
		-- kind = {
		-- 	["File"] = { " ", "Tag" },
		-- 	["Module"] = { " ", "Exception" },
		-- 	["Namespace"] = { " ", "Include" },
		-- 	["Package"] = { " ", "Label" },
		-- 	["Class"] = { " ", "Include" },
		-- 	["Method"] = { "M ", "Function" },
		-- 	["Property"] = { " ", "@property" },
		-- 	["Field"] = { " ", "@field" },
		-- 	["Constructor"] = { " ", "@constructor" },
		-- 	["Enum"] = { "", "@number" },
		-- 	["Interface"] = { " ", "Type" },
		-- 	["Function"] = { "󰊕 ", "Function" },
		-- 	["Variable"] = { " ", "@variable" },
		-- 	["Constant"] = { " ", "Constant" },
		-- 	["String"] = { "󰅳 ", "String" },
		-- 	["Number"] = { " ", "Number" },
		-- 	["Boolean"] = { " ", "Boolean" },
		-- 	["Array"] = { "󱒅 ", "Type" },
		-- 	["Object"] = { "󱃻 ", "Type" },
		-- 	["Key"] = { " ", "" },
		-- 	["Null"] = { "󰟢 ", "Constant" },
		-- 	["EnumMember"] = { " ", "Number" },
		-- 	["Struct"] = { " ", "Type" },
		-- 	["Event"] = { " ", "Constant" },
		-- 	["Operator"] = { " ", "Operator" },
		-- 	["TypeParameter"] = { " ", "Type" },
		-- 	-- ccls
		-- 	["TypeAlias"] = { " ", "Type" },
		-- 	["Parameter"] = { " ", "@parameter" },
		-- 	["StaticMethod"] = { "󰍘 ", "Function" },
		-- 	["Macro"] = { " ", "Macro" },
		-- 	-- for completion sb microsoft!!!
		-- 	["Text"] = { " ", "String" },
		-- 	["Snippet"] = { " ", "@variable" },
		-- 	["Folder"] = { " ", "@parameter" },
		-- 	["Unit"] = { " ", "Number" },
		-- 	["Value"] = { " ", "@variable" },
		-- },
	},
})
