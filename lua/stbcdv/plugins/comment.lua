local setup, comment = pcall(require, "Comment")
local ft = require("Comment.ft")

if not setup then
	return
end

ft.set("systemverilog", { "//%s", "/*%s*/" }) -- 设置 systemverilog 的注释格式

comment.setup()
