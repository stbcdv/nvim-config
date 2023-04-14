# NeoVim Configuration
This config is for `systemverilog`

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

opt.conceallevel = 1 -- so than `` can display in markdown file
```
## Plugins

## [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
文件树展示
### 快捷键
|快捷键|功能|
|:-:|:-:|
|<leader>e|唤起文件树界面|
|q|退出文件树|

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


