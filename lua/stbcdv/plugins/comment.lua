local setup, comment = pcall(require, "Comment")
local ft = require("Comment.ft")

if not setup then
	return
end

ft.set("systemverilog", { "//%s", "/*%s*/" }) -- 设置 systemverilog 的注释格式

comment.setup({
	ignore = "^$",

	---Pre-hook, called before commenting the line
	---@type function|nil
	pre_hook = function(...)
		local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
		if loaded and ts_comment then
			return ts_comment.create_pre_hook()(...)
		end
	end,

	---Post-hook, called after commenting is done
	---@type function|nil
	post_hook = nil,
})
