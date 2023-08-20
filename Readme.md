# NeoVim Configuration
This configuration of neovim is for `systemverilog`, `UVM`, lua and python(include dap)
关于 LSP 的问题，svls 是会在 git 下有效，svlangserver 在任意文件夹下有效
**可参考的配置**
[Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
## nvim 的语法高亮是真的有毒
nvim 中自带的语法高亮是在不行，感觉需要修改的地方很多，奈何自己不会写，存粹取别人的长处以弥补
[verilog_systemverilog](https://github.com/vhda/verilog_systemverilog.vim)

## require
**must**

git, lazygit, fzf, fd, bat, ripgrep, clang or gcc, make, miniconda3, python(pyenv, virtual env), rust, cargo, luajit, nerd-font

**option**

ranger, broot, htop, procs

## nvim options
这里主要说明几个不常用的
```lua
local opt          = vim.opt
opt.mouse          = 'a' -- 开启鼠标控制
opt.mousemoveevent = true
opt.clipboard:append('unnamedplus') -- 访问剪贴板
-- 显示缩进线 enter为eol = '⤶', 简单的可以替代一些缩进的插件
vim.opt.listchars = { trail = '✚', extends = '◀', precedes = '▶', space = '_', tab = '|~'}
vim.opt.list      = true
opt.foldmethod    = 'indent'
opt.foldmethod    = 'syntax'
opt.foldenable    = false
opt.updatetime    = 6000
opt.conceallevel  = 0     -- so than `` can display in markdown file
opt.backupcopy    = "yes" -- inode setting, after vim editing, the inode of file isn't changed.
```

[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

## vim 自带的快捷键
|   快捷键   |                    功能                    |
|     :-:    |                     :-:                    |
|     jk     |在插入模式下使用退出插入模式进入 normal 模式|
|   \<C-d\>  |                 向下跳转9行                |
|   \<C-u\>  |                 向上跳转9行                |
|\<leader\>nh|                  取消高亮                  |
| \<leader\>-|                   数字减1                  |
| \<leader\>+|                   数字增1                  |
|      x     |                    "_x"                    |

## **Plugins**

## [impatient.nvim](https://github.com/lewis6991/impatient.nvim)
提高插件的启动效率, 注意该插件最好放在所有插件之前，具体看 `./lua/stbcdv/plugins-setup.lua`

## [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
文件树展示
|   快捷键  |            功能            |
|    :-:    |             :-:            |
|\<leader\>e|       唤起文件树界面       |
|     q     |         退出文件树         |
| file edit |其他文件移动, 重命名等快捷键|
|     g?    |  查看详细 shortcut mapping |

## [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
在 neovim 内部调用终端
- 如何确保路径，首先进入 neovim 后第一次到的路径就是以后所有的路径, 想要修改有点麻烦(已解决)
- 替代 lazygit.nvim 插件
- 可以呼出 broot, 文件浏览窗口
- 可以呼出 ranger, 文件浏览窗口
- 可以使用 (h)top 查看系统资源信息
- 可以调用 python 环境, 并在其中执行命令

|   快捷键   |                                           功能                                          |
|     :-:    |                                           :-:                                           |
|   \<c-`\>  | 呼出终端窗口(原来是c-\,但是该键被占用了), 另一种方法是使用 tmux, 后面又改为\<leader\>te |
|number\<c-`>|                         在normal mode 下执行，唤起多个 terminal                         |
|\<leader\>br|                                          broot                                          |
|\<leader\>rg|ranger, 类似于 broot, 但是支持预览文件, 但是编辑文件时并不会跳转到当前的vim窗口中(已解决)|
|\<leader\>lg|                                         lazygitg                                        |
|\<leader\>py|                                         python3                                         |
|\<leader\>ht|                                       top or htop                                       |
|\<leader\>nc|                     ncdu: 查看当前目录下的文件及其大小(快捷键被取消)                    |

以上命令都是交互式的命令，如果命令是输出结果则并不会 hold 窗口(例如 dust)

[如何从 toggleterm 终端中跳转到当前 vim 文件窗口中](https://github.com/akinsho/toggleterm.nvim/issues/377)

[neovim-remote 使用方法](https://www.youtube.com/watch?v=xO5yMutC-rM)

[终端路径如何根据当前的工作路径一起变化](https://github.com/akinsho/toggleterm.nvim/issues/304)

[终端路径如何根据当前的工作路径一起变化(method two)](https://github.com/akinsho/toggleterm.nvim/issues/346)

在 nvim 中唤起终端后，在另一文件路径下唤起终端，路径是不变的，除否 exit 之前的终端，然后再次唤起(针对\<C-`\>)

## [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
### 搭配使用的插件
- [project.nvim](https://github.com/ahmedkhalf/project.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

|   快捷键   |                                        功能                                       |
|     :-:    |                                        :-:                                        |
|\<leader\>ff|       模糊搜索文件, 如果输入 test test, 等价于 test, 可以使用 testtest 搜索       |
|\<leader\>fr|                                  搜索编辑过的文件                                 |
|\<leader\>fa|                                  搜索执行过的命令                                 |
|\<leader\>fs|                                   搜索整个字符串                                  |
|\<leader\>fb|                                  搜索 buffer 标签                                 |
|\<leader\>ft|                                     搜索 tags                                     |
|\<leader\>fp|             搜索查看过的工程, 不清楚是不是需要 nvim file 后才会被记录             |
|d or \<C-d\>|在 project window, in normal model, delete selected project list or in insert model|
|w or \<C-w\>|  change_working_directory in normal or insert model, but not work toggleterm.nvim |

以下是记录搜索历史的文件

/Users/user_name/.local/share/nvim/telescope_history
/Users/user_name/.local/share/nvim/project_nvim

## [undotree](https://github.com/mbbill/undotree)
记录文件内容的修改信息，类似于 git，可以直接回滚到文件未修改的版本

|   快捷键  |      功能      |
|    :-:    |       :-:      |
|\<leader\>u|唤出文件修改记录|

## [nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua)
neovim clipboard manager, not work system clipboard
[vim 寄存器介绍](https://zhuanlan.zhihu.com/p/25332320)
|   快捷键   |                   功能                   |
|     :-:    |                    :-:                   |
|\<leader\>fv|              唤出剪切板记录              |
|  ""p -> p  |粘贴, " 是一个寄存器名称, * 代表系统剪切板|
|      P     |                系统剪切板                |

## [Tagbar](https://github.com/preservim/tagbar)
[说明文档](https://github.com/preservim/tagbar/blob/master/doc/tagbar.txt)

## 自动补全
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer): 提供不同文件之间的 buffer 补全
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets): 提供了 systemverilog 的 snippet, json 格式, 修改了 task 和 function 的snippet
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag): 删除了，该插件主要是针对 html 等语言
- [vim-surround](https://github.com/tpope/vim-surround)
[如何使用 LuaSnip 编写代码片段](https://zjp-cn.github.io/neovim0.6-blogs/nvim/luasnip/doc1.html)

| 快捷键|                       功能                       |
|  :-:  |                        :-:                       |
| cs\[\(|             把 \[\] 替换为 () change             |
|  ysw( |                   给字符添加 ()                  |
|  ds\[ |                 移除 \[\] delete                 |
|  yss( |                将整行使用 () 包裹                |
|  tab  |                  在候选框中选择                  |
|\<c-f\>|             snippet 待写位置向下跳转             |
|\<c-b\>|snippet 待写位置向上跳转，可以在 insert 模式下跳转|

```lua
-- luasnip 使用
luasnip.add_snippets("systemverilog", {
	s({ trig = "always", dscr = "Insert an always block" }, {
		t({ "always @(" }),
		i(1, "clock"),
		t({ ") : " }), -- "" 是换行
		i(2, "blockName"),
		t({ "", "\t" }),
		i(3),
		t({ "", "end : " }),
		f(function(args, snip)
			return args[1][1]
		end, { 2 }),
	}),
})
```
## lsp
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim): 控制顶栏各变量属性等的 UI
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim): 控制 tab list 中的 UI
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim): Linters and Formatters
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): 提供了部分 formatting 和 code [folding](https://www.jmaguire.tech/posts/treesitter_folding/) 功能
不知道 [coc.nvim](https://github.com/neoclide/coc.nvim) 功能怎么样

许多快捷键是在lsp下工作的，没有lsp有的会出现问题, 得仔细考虑下 nvim-lsp 和 coc.nvim 之间的差别
|   快捷键   |          功能          |
|     :-:    |           :-:          |
|     gf     |lsp_find, 类似于文件跳转|
|     gD     |                        |
|     gd     |                        |
|     gi     |                        |
|     [d     |  diagnostic_jump_prev  |
|     ]d     |  diagnostic_jump_next  |
|      K     |      参看文档定义      |
| \<leader\>o|     LSoutlineToggle    |
|\<leader\>ca|       code action      |
|\<leader\>rn|      变量重新命名      |
| \<leader\>D|  show line diagnostic  |
| \<leader\>d| show cursor diagnostic |
|\<leader\>fm|     formating code     |
### 注意点
变量，class，method 等图标是由 lspsaga 插件提供的，有时候官方的可能会出现乱码，可能是图标编码除了问题；解决方法：等官方解决，第二种自己修改(有些图标没找见，可能得再看看)
formatter 的功能是格式化内容，并不会对内容的对错进行 linter，在运行 formatter 前可能需要确保内容编写的正确性。

## [Comment.nvim](https://github.com/numToStr/Comment.nvim)
注释
```lua
-- 不知道为什么会需要自己设置，可能是修改了 systemverilog 的高亮文件
-- 该插件后面添加了 systemverilog 的支持
local ft = require('Comment.ft')
ft.set('systemverilog', {'//%s', '/*%s*/'}) -- 设置 systemverilog 的注释格式
```
|    快捷键   |         功能        |
|     :-:     |         :-:         |
|     gcc     |  注释单行/取消注释  |
|gc number j/k|向下/上注释 number 行|
|     gbc     |        注释块       |
|gb number j/k|  向下/上多行注释块  |

## [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
查询 git 的状态

|    快捷键   |       功能      |
|     :-:     |       :-:       |
| \<leader\>gc|   查询 commit   |
|\<leader\>gfc|查询 git_bcommits|
| \<leader\>gb|   查询 branch   |
| \<leader\>gs|  查询 git 状态  |

## 窗口管理
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [vim-maximizer](https://github.com/szw/vim-maximizer)
- [bufferline](https://github.com/akinsho/bufferline.nvim)

|       快捷键       |                                                     功能                                                    |
|         :-:        |                                                     :-:                                                     |
|    \<leader\>sm    |                                                最大化当前窗口                                               |
|    \<leader\>sv    |                                                   垂直分割                                                  |
|    \<leader\>sh    |                                                   水平分割                                                  |
|    \<leader\>se    |                                           平均每个文件窗口所占面积                                          |
|    \<leader\>cx    |                                         关闭当前编辑的文件页中的分屏                                        |
|    \<leader\>tx    |                                         关闭当前标签页(感觉有点问题)                                        |
|    \<leader\>ta    |                                                新建一个标签页                                               |
|    \<leader\>tc    |                                                  关闭标签页                                                 |
|  \<leader\>number  |跳转到相应标签页, 只支持1-9, 其实够用不到那么多(\<leader\>1 是指当前标签栏的第一个标签, 并不是指 buffer 数字)|
|    \<leader\>bn    |                                          移动当前标签页到下一个位置                                         |
|    \<leader\>bp    |                                          移动当前标签页到上一个位置                                         |
|    \<leader\>bc    |                                                关闭当前buffer                                               |
|    \<leader\>bo    |                                               只保留当前buffer                                              |
|     \<C-hjkl\>     |                                              分页之间的相互切换                                             |
|    \<leader\>bg    |                    BufferLinePick, 标签页文件名首写字符高亮, 随后按对应高亮的字母实现跳转                   |
|  bufferline-groups |                        需要人为配置，根据 filename 和 postfix 对 buffer tab 进行分组                        |
|:BufferLineTogglePin|                                 也有其配置选项，函数归属于 bufferline.groups                                |

## 界面美化
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim): [vim 主题网站](https://vimcolorschemes.com/folke/tokyonight.nvim), 感兴趣的可以自己查找
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): 控制 nvim-tree 中的文件 UI

|快捷键|   功能  |
|  :-: |   :-:   |
|   e  | 新建文件|
|   q  |quit nvim|

## hop.nvim(give up)
这个插件给我的感觉是功能很强大，但是又很少回去用
|    快捷键   |                           功能                          |
|     :-:     |                           :-:                           |
|   :HopWord  |hop 界面中所有的 work, A/BC->the word after/before cursor|
|   :HopChar  |                           字符                          |
|   :HopLine  |                            行                           |
|:HopLineStart|                      行的第一个字符                     |
| :HopVertical|                        光标的垂直                       |
| :HopPattern |  这应该是最好用的, 输入该命令后接着输入需要查找的字符串 |

## flash.nvim
内容位置快速跳转
|     快捷键    |                              功能                             |
|:-------------:|                        :-------------:                        |
|    f<chars>   |按f进入向后查找(并不局限于一行的内容)，再次按f则跳转下一个chars|
|    F<chars>   |                            向前查找                           |
|    s<chars>   |                 查找范围为当前屏幕中的所有内容                |
|   yr<chars>w  | 屏幕内容中选中并复制<chars>所在的word，并跳回原先光标所在位置 |
|   yR<chars>   |            选中并复制一段函数,depend on treesitter            |
|       S       |                 选中一段内容，按y复制，按d删除                |

## Tabular
文字对齐，需要一定的正则表达式知识, 格式 `Tabularize patten`
|        快捷键       |           功能           |
|  :---------------:  |     :---------------:    |
|    Tabularize /<=   |       按照 <= 对齐       |
|    Tabularize /=    |        按照 = 对齐       |
|Tabularize /\|/c0c0c0|适用于 markdown 的表格对齐|
| Tabularize /\\/\\/  |     对 // 进行对齐操作   |
还可以将常使用的 pattern alias 成短语，放置在该插件的 after/plugins 文件夹中的 TabularizeMap.vim 中(为什么不单独弄一个文件,我也想啊, 但是他不同意)

## 其他
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [sqlite.lua](https://github.com/kkharji/sqlite.lua): 管理剪切板数据

## neovim 特殊小知识
- 环境路径: `:lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))`
- `:checkhealth`
- let g 和 vim.g
```lua
-- let g:python3_host_prog = '/usr/local/bin/python3' writre instead by lua
vim.g.python3_host_prog = "/usr/local/bin/python3"
```
- matchit: 属于 vim 自带的插件，使用 % 跳转语法块的开始和结尾
