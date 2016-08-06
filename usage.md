# 进一步配置

- Tagbar https://github.com/majutsushi/tagbar/wiki
- Easymotion https://github.com/easymotion/vim-easymotion#bidirectional-motions
- CtrlP https://github.com/ctrlpvim/ctrlp.vim#once-ctrlp-is-open
- YouCompleteMe
- vim-go  :GoInstallBinaries

# 目录树 - NERDTree

[Github](https://github.com/scrooloose/nerdcommenter)

	:NERDTree 打开 目录树
	:NERDTreeToggle  打开/关闭 目录树

更多使用,请在打开状态下输入  ?

# 快速注释 - NERDCommenter

[Github](https://github.com/scrooloose/nerdcommenter)

	<leader>cc 注释
	<leader>cu 解除注释
	<leader>c<space> 接触/添加注释(智能判断)

# 历史记录 - Gundo

[Github](https://github.com/sjl/gundo.vim)

	:GundoToggle 打开/关闭窗口
	j/k   上下选择
	p     查看diff
	回车  回滚文件到这个时刻的版本

	noremap <leader>h :GundoToggle<CR>

# 快速跳转 - EasyMotion

[Github](https://github.com/easymotion/vim-easymotion)

	<leader><leader>w
	<leader><leader>b
	<leader><leader>s
	<leader><leader>f

	map <leader><leader>j <Plug>(easymotion-j)
	map <leader><leader>k <Plug>(easymotion-k)
	map <Leader><leader>h <Plug>(easymotion-linebackward)
	map <Leader><leader>l <Plug>(easymotion-lineforward)
	map <leader><leader>. <Plug>(easymotion-repeat)

	:help easymotion.txt
	https://github.com/haya14busa/incsearch.vim
	# Incsearch

	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	map g/ <Plug>(incsearch-stay)

# Incsearch-EasyMotion

[Github](https://github.com/haya14busa/incsearch-easymotion.vim)

	map z/ <Plug>(incsearch-easymotion-/)
	map z? <Plug>(incsearch-easymotion-?)
	map zg/ <Plug>(incsearch-easymotion-stay)

#  大纲导航 - Tagbar

[Github](https://github.com/majutsushi/tagbar)

安装依赖 Exuberant ctags

sudo apt-get install ctags

sudo yum install ctags

brew install ctags

	:TagbarToggle

	nmap <F9> :TagbarToggle<CR>

? 查看帮助

# 模糊搜索 - Ctrlp

github: 原始kien/ctrlp, 使用的是国人改进版本 ctrlpvim/ctrlp.vim
https://github.com/kien/ctrlp.vim
https://github.com/ctrlpvim/ctrlp.vim

模糊搜索, 可以搜索文件/buffer/mru/tag等等

	<leader>-f模糊搜索最近打开的文件(MRU)
	<leader>-p模糊搜索当前目录及其子目录下的所有文件
	搜索框出来后, 输入关键字, 然后
	ctrl + j/k 进行上下选择
	ctrl + x 在当前窗口水平分屏打开文件
	ctrl + v 同上, 垂直分屏
	ctrl + t 在tab中打开

# 模糊搜索 - CtrlP-funky

[Github]https://github.com/tacahiroy/ctrlp-funky

模糊搜索当前文件中所有函数

	<leader>fu 进入当前文件的函数列表搜索
	<leader>fU 搜索当前光标下单词对应的函数

# solarized 主题

[Github](https://github.com/altercation/vim-colors-solarized)

# moloki 主题

[Github](https://github.com/tomasr/molokai)


# 括号高亮 - Rainbow_Parentheses

[Github](https://github.com/kien/rainbow_parentheses.vim)

# 快速执行 - QuickRun

	映射<leader>r以及F10快捷键
	使用message进行结果展示

# 语法检查 - Syntastic

[Github](https://github.com/scrooloose/syntastic)

被动技能, 设置打开时开启, 则打开对应文件的时候, 会自动进行语法检查, 高亮错误位置

注意, 针对某些具体语言, 指定了checker, 需要对应安装外部依赖, 例如pyflakes/pep8/jshint等等

主动技能, k-vim中配置绑定了<leader>s 打开错误列表面板

	:Errors 显示错误面板
	:lnext  到下一个错误
	:lprevious 到上一个错误

# 全局搜索 - CtrlSF

[Github](https://github.com/dyng/ctrlsf.vim)

Ctrl-Shift-F in sublime text

Make sure you have ack, ag or pt installed.

An ack/ag/pt powered code search and view tool, like ack.vim or :vimgrep but together with more context, and let you edit in-place with powerful edit mode.

:CtrlSF pattern dir 

sudo apt-get install silversearcher-ag
sudo apt-get install ack-grep

ag>ack>grep

//grep的查找,sed的编辑,awk在其对数据分析并生成报告时,显得尤为强大

所选的单词上使用 \

# CtrlSpace 

类似 CtrlP 
tabs / buffers / files management
fast fuzzy searching powered by Go
workspaces (sessions)
bookmarks for your favorite projects 

[Github](https://github.com/vim-ctrlspace/vim-ctrlspace)

:CtrlSpace

# NERDTree-Tabs

[Github](https://github.com/jistr/vim-nerdtree-tabs)

:NERDTreeTabsOpen switches NERDTree on for all tabs.

:NERDTreeTabsClose switches NERDTree off for all tabs.

:NERDTreeTabsToggle toggles NERDTree on/off for all tabs.

:NERDTreeTabsFind find currently opened file and select it

# vim-go

let g:go_bin_path = expand("~/.gotools")
let g:go_bin_path = "/home/fatih/.mypath" 

:GoInstallBinaries

# UltiSnips & vim-snippets 

<tigger><Tab>

tigger如下:

snippet <tigger> "comments" <flag>
${1:name}
${1/(\w+).*/${1}/}
endsnippet

可以直接用 shell, 也可以使用 !v 或 !p  嵌入 vimscript 或 python

${1:default text}
<tab> to next placeholder <S-tab> to previous

1 2....0 stop, complete

placeholer可以包括镜像和求值,甚至整个其它tab stops
嵌套的如果被包含,则 内部的直接忽略

snippet div
<div ${1: id="${2:id}"}${3: class="${4:class}"}>
$0
</div>
endsnippet

placeholder -- tab stop
mirror   can use  ${1/foo/bar/g} change all the mirrors

`` 求值,如果错误为空串,并且:messages可以看到或直接显示quickfix

function

Filname([{expr}] [, {default text}]
$1 to refer filename in expr
if expr empty, only filename return, otherwise wrap the filename

visual

${visual} v select text <tab> trigger<tab> the all the ${VISUAL} in snippet will be replaced by v selected text.




# trailing-whitespace

[Github](https://github.com/bronson/vim-trailing-whitespace)

	<leader><space> 删除行尾所有空格

显示所有行尾的空格

# Expand-region

[Github](https://github.com/terryma/vim-expand-region)

	v 增加选中范围
	V 减少选中范围

#close-tag

被动 自动补全

#repeat

[Github](https://github.com/tpope/vim-repeat)

强化 .

# surround

[Github](https://github.com/tpope/vim-surround)

# 替换: cs"'
"Hello world!" -> 'Hello world!'

# 替换-标签(t=tag): cst"
<a>abc</a>  -> "abc"

cst<html>
<a>abc</a>  -> <html>abc</html>

# 删除: ds"
"Hello world!" -> Hello world!

# 添加(ys=you surround): ysiw"
Hello -> "Hello"

# 添加: csw"
Hello -> "Hello"

# 添加-整行: yss"
Hello world -> "Hello world"

# ySS"
Hello world ->
"
    hello world
"

# 添加-两个词: veeS"
hello world -> "hello world"

# 添加-当前到行尾: ys$"

# 左符号/右符号 => 带不带空格
cs([
(hello) -> [ hello ]

cs(]
(hello) -> [hello]

这个重复 easyMotion 不支持