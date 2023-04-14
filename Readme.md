# NeoVim Configuration
This config is for `systemverilog`

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
|<leader>br|broot|
|<leader>lg|lazygit|
|<leader>py|python3|
|<leader>ht|top or htop|

