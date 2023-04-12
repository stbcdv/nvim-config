local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimtreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "▸",
          arrow_open = "▾",
        },
      },
    },
  },
  actions = {
    open_file = {
      window_picker = {
         enable = false,
      },
     },
  },
  filters = {
    dotfiles = true,
  },	
 })

