# NeoVim Configuration
This config is for `systemverilog`
**可参考的配置**
[Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
## nvim 的语法高亮是真的有毒

## nvim options
这里主要说明几个不常用的
```lua
opt.mouse = 'a' -- 开启鼠标控制
opt.mousemoveevent = true
opt.clipboard:append('unnamedplus') -- 访问剪贴板

-- 显示缩进线 enter为eol = '⤶', 简单的可以替代一些缩进的插件
vim.opt.listchars = { trail = '✚', extends = '◀', precedes = '▶', space = '_', tab = '|~'}
vim.opt.list = true

opt.foldmethod='indent'
opt.foldmethod='syntax'
opt.foldenable = false

opt.updatetime=6000

opt.conceallevel = 0 -- so than `` can display in markdown file
```
## Plugins

## [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
文件树展示
### 快捷键
|快捷键|功能|
|:-:|:-:|
|<leader>e|唤起文件树界面|
|q|退出文件树|

## [impatient.nvim](https://github.com/lewis6991/impatient.nvim)
提高插件的启动效率

## [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
在 neovim 内部调用终端
- 如何确保路径，首先进入 neovim 后第一次到的路径就是以后所有的路径, 想要修改有点麻烦
- 替代了 lazygit.nvim 插件
- 可以呼出 broot，文件浏览窗口
- 可以使用 top 查看系统资源信息，当然也可以将 top 替换为 htop 命令
- 可以调用 python 环境
### 快捷键
|快捷键|功能|
|:-:|:-:|
|c-/|呼出终端窗口(原来是c-\,但是该键被占用了)|
|\<leader\>br|broot|
|\<leader\>lg|lazygit|
|\<leader\>py|python3|
|\<leader\>ht|top or htop|

## [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
### 搭配使用的插件
- [project.nvim](https://github.com/ahmedkhalf/project.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
### 快捷键
|快捷键|功能|
|:-:|:-:|
|\<leader\>ff|模糊搜索文件|
|\<leader\>fr|搜索编辑过的文件|
|\<leader\>fp|搜索查看过的文件夹|
|\<leader\>fa|搜索执行过的命令|
|\<leader\>fs|搜索整个字符串|
|\<leader\>fb|搜索 buffer 标签|
|\<leader\>ft|搜索 tags|

以下是搜索记录
/Users/user_name/.local/share/nvim/telescope_history
/Users/user_name/.local/share/nvim/project_nvim

## [undotree](https://github.com/mbbill/undotree)
记录文件修改信息，类似于 git，可以直接回滚到文件未修改的版本
### 快捷键
|快捷键|功能|
|:-:|:-:|
|\<leader\>u|唤出文件修改记录|

## 自动补全
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [LuaSnip]()
- [cmp_luasnip]()
- [friendly-snippets]()
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)

## 窗口管理
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [vim-maximizer](https://github.com/szw/vim-maximizer)
- [bufferline](https://github.com/akinsho/bufferline.nvim)
### 快捷键
|快捷键|功能|
|:-:|:-:|
|\<leader\>sm|最大化当前窗口|
|\<leader\>sv|垂直分割|
|\<leader\>sh|水平分割|
|\<leader\>se|平均每个文件窗口所占面积|
|\<leader\>cx|关闭当前编辑的文件页中的分屏|
|\<leader\>tx|关闭当前标签页(感觉有点问题)|
|\<leader\>ta|新建一个标签页|
|\<C-hjkl\>|分页之间的相互切换|
|\<leader\>number|跳转到相应标签页|
|\<leader\>bg|BufferLinePick|
|\<leader\>tn|跳转到下一个标签页|
|\<leader\>tp|跳转到上一个标签页|
|\<leader\>tc|关闭标签页|
|\<leader\>bc|关闭当前buffer|
|\<leader\>bo|只保留当前buffer|

## 界面美化
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
[主题网站](https://vimcolorschemes.com/folke/tokyonight.nvim)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

