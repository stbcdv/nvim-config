local status, ColorTheme = pcall(vim.cmd, "colorscheme tokyonight-moon")
-- local status, ColorTheme = pcall(vim.cmd, "colorscheme nightfly")
-- local cursor_color = vim.api.nvim_get_option("guicursor")
vim.api.nvim_set_option("guicursor", "n-v:block-Cursor/lCursor,i-c-ci:ver25")

-- vim.api.nvim_command("set guicursor+=i:ver25")
-- vim.api.nvim_command("set guicursor+=c:ver25")
-- vim.api.nvim_command("set guicursor+=ci:ver25")

vim.api.nvim_command([[
  highlight! CursorLineNr guibg=Gray40 guifg=White
  highlight! CursorLine   guibg=Gray20
  highlight! CursorColumn guibg=Gray20
  highlight! Cursor       guifg=white guibg=red
  highlight! iCursor 	  guifg=white guibg=steelblue
]])

-- Orange1
-- vim.api.nvim_set_option("guicursor", cursor_color)

-- vim.api.nvim_command("highlight CursorLine guibg=#00ff00")
-- local status, _ = pcall(vim.cmd, "colorscheme nord")

-- if not status then
--   print("Colorscheme not found")
--   return
-- end
-- Example config in lua
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = false
-- vim.g.nord_uniform_diff_background = true
-- vim.g.nord_bold = false

-- -- Load the colorscheme
-- require('nord').set({
--     nord_contrast = true,
--     nord_borders = false ,
--     nord_disable_background = true,
--     nord_italic = false ,
-- })
-- Lua
-- require('onedark').setup  {
--     -- Main options --
--     style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--     transparent = false,  -- Show/hide background
--     term_colors = true, -- Change terminal color as per the selected theme style
--     ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--     cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
--
--     -- toggle theme style ---
--     toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
--     toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
--
--     -- Change code style ---
--     -- Options are italic, bold, underline, none
--     -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
--     code_style = {
--         comments = 'italic',
--         keywords = 'none',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--     },
--
--     -- Lualine options --
--     lualine = {
--         transparent = false, -- lualine center bar transparency
--     },
--
--     -- Custom Highlights --
--     colors = {}, -- Override default colors
--     highlights = {}, -- Override highlight groups
--
--     -- Plugins Config --
--     diagnostics = {
--         darker = true, -- darker colors for diagnostic
--         undercurl = true,   -- use undercurl instead of underline for diagnostics
--         background = true,    -- use background color for virtual text
--     },
-- }
-- require('onedark').load()
