local M = {}

M.config = function()
	vim.g.undotree_WindowLayout = 1
	vim.g.undotree_SplitWidth = 40
	vim.g.undotree_DiffpaneHeight = 10 -- default
	vim.g.undotree_DiffAutoOpen = 1 -- default
	vim.g.undotree_SetFocusWhenToggle = 1
	vim.g.undotree_TreeNodeShape = "●"
	vim.g.undotree_TreeVertShape = "┃"
	vim.g.undotree_TreeSplitShape = "/"
	vim.g.undotree_TreeReturnShape = "\\"
	vim.g.undotree_RelativeTimestamp = 1
	vim.g.undotree_HighlightChangedText = 1
	vim.g.undotree_HighlightChangedWithSign = 1
	vim.g.undotree_HighlightSyntaxAdd = "DiffAdd"
	vim.g.undotree_HighlightSyntaxChange = "DiffChange"
	vim.g.undotree_HighlightSyntaxDel = "DiffDelete"
	vim.g.undotree_HelpLine = 0
	vim.g.undotree_CursorLine = 1
end

return M
