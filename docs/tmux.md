# Tmux 使用指南

> Tmux 是一个终端复用器，可以在单个终端窗口中管理多个会话、窗口和面板，支持会话持久化（断开连接后进程继续运行）。

## 核心概念

| 概念 | 说明 |
|------|------|
| **Session（会话）** | 独立的工作环境，可包含多个窗口 |
| **Window（窗口）** | 会话中的标签页，可包含多个面板 |
| **Pane（面板）** | 窗口中的分屏区域 |

## 前缀键

本配置使用 `Ctrl + a` 作为前缀键（默认为 `Ctrl + b`）。

所有快捷键需先按前缀键，再按功能键。例如：`<prefix> c` 表示先按 `Ctrl + a`，再按 `c`。

## 会话管理

### 快捷键速查

| 快捷键 | 功能 |
|--------|------|
| `<prefix> d` | 分离当前会话（后台运行） |
| `<prefix> s` | 列出所有会话并切换 |
| `<prefix> $` | 重命名当前会话 |
| `<prefix> (` | 切换到上一个会话 |
| `<prefix> )` | 切换到下一个会话 |

### 命令行操作

```bash
# 新建会话
tmux new -s <session-name>

# 列出所有会话
tmux ls

# 附加到会话
tmux attach -t <session-name>
tmux a -t <session-name>  # 简写

# 杀死会话
tmux kill-session -t <session-name>

# 杀死所有会话
tmux kill-server
```

## 窗口管理

| 快捷键 | 功能 |
|--------|------|
| `<prefix> c` | 新建窗口 |
| `<prefix> n` | 下一个窗口 |
| `<prefix> p` | 上一个窗口 |
| `<prefix> 0-9` | 切换到第 0-9 个窗口 |
| `<prefix> ,` | 重命名当前窗口 |
| `<prefix> w` | 列出所有窗口并切换 |
| `<prefix> &` | 关闭当前窗口 |
| `<prefix> f` | 按名称查找窗口 |

## 面板管理

### 分屏

| 快捷键 | 功能 |
|--------|------|
| `<prefix> %` | 垂直分屏（左右布局） |
| `<prefix> "` | 水平分屏（上下布局） |

### Vim 风格导航（本配置特有）

| 快捷键 | 功能 |
|--------|------|
| `<prefix> h` | 切换到左侧面板 |
| `<prefix> j` | 切换到下方面板 |
| `<prefix> k` | 切换到上方面板 |
| `<prefix> l` | 切换到右侧面板 |

### 其他面板操作

| 快捷键 | 功能 |
|--------|------|
| `<prefix> x` | 关闭当前面板 |
| `<prefix> q` | 显示面板编号 |
| `<prefix> o` | 切换到下一个面板 |
| `<prefix> {` | 与上一个面板交换位置 |
| `<prefix> }` | 与下一个面板交换位置 |
| `<prefix> !` | 将当前面板拆分为独立窗口 |
| `<prefix> z` | 最大化/还原当前面板 |
| `<prefix> Space` | 切换面板布局 |

### 调整面板大小

```bash
# 按住前缀键不放，连续按方向键调整
Ctrl + a（按住不放）+ 方向键

# 或使用命令
<prefix> :resize-pane -U 10   # 向上扩展 10 行
<prefix> :resize-pane -D 10   # 向下扩展 10 行
<prefix> :resize-pane -L 10   # 向左扩展 10 列
<prefix> :resize-pane -R 10   # 向右扩展 10 列
```

## 复制模式

本配置使用 Vi 模式进行复制操作。

### 进入复制模式

```
<prefix> [    → 进入复制模式
```

### Vi 风格操作

| 按键 | 功能 |
|------|------|
| `h/j/k/l` | 移动光标 |
| `w` | 下一个词首 |
| `b` | 上一个词首 |
| `e` | 下一个词尾 |
| `0` | 行首 |
| `$` | 行尾 |
| `Ctrl + u` | 向上翻半页 |
| `Ctrl + d` | 向下翻半页 |
| `g` | 跳到缓冲区开头 |
| `G` | 跳到缓冲区结尾 |
| `v` | 开始选择（可视模式） |
| `y` | 复制选中内容 |
| `q` | 退出复制模式 |

### 粘贴

```
<prefix> ]    → 粘贴内容
```

## 配置管理

### 重新加载配置

```
<prefix> r    → 重新加载 ~/.tmux.conf（本配置特有）
```

### 手动重载

```bash
tmux source-file ~/.tmux.conf
```

## 本配置特点

```bash
# 前缀键：Ctrl + a（更易按）
set -g prefix C-a

# Vim 风格面板导航
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# Vi 模式复制
setw -g mode-keys vi

# 默认 Shell：zsh
set-option -g default-shell /bin/zsh

# 256 色终端
set -g default-terminal "screen-256color"
```

## 状态栏

本配置状态栏说明：

```
[session-name]  0:vim  1:zsh  2:python  [2024-01-15]
```

- 左侧：当前会话名称（青色）
- 中间：窗口列表（当前窗口高亮）
- 右侧：当前日期

## 常用工作布局

### 布局一：开发环境

```
┌──────────────────┬──────────────────┐
│                  │                  │
│   vim / 编辑器    │   shell / 测试    │
│                  │                  │
├──────────────────┴──────────────────┤
│                                      │
│          底部状态栏 / 日志输出          │
│                                      │
└──────────────────────────────────────┘
```

操作步骤：

```bash
# 1. 创建新会话
tmux new -s dev

# 2. 垂直分屏（Ctrl + a %）
# 3. 水平分屏右侧面板（Ctrl + a "）
# 4. 用 h/j/k/l 在面板间切换
```

### 布局二：监控面板

```
┌──────────────────┬──────────────────┐
│                  │                  │
│   主工作区        │   htop / 监控     │
│                  │                  │
│                  │                  │
│                  │                  │
├──────────────────┴──────────────────┤
│                                      │
│          tail -f / 日志输出            │
│                                      │
└──────────────────────────────────────┘
```

### 布局三：多项目管理

```bash
# 项目 A
tmux new -s projectA

# 项目 B（在新窗口中）
tmux new -s projectB

# 快速切换
Ctrl + a s    → 列出会话并选择
```

## 实用技巧

1. **会话持久化** — SSH 连接断开后会话仍在后台运行，重连后 `tmux a` 恢复
2. **快速重载** — 修改配置后 `<prefix> r` 即可生效
3. **面板缩放** — `<prefix> z` 临时最大化面板，再按恢复
4. **批量命令** — `<prefix> :` 进入命令模式，可执行任意 tmux 命令
5. **同步面板** — 在多个面板同时输入相同内容（适合批量操作）

```bash
# 同步输入到所有面板
<prefix> :setw synchronize-panes on

# 关闭同步
<prefix> :setw synchronize-panes off
```

## 故障排除

### 面板显示异常

```bash
# 强制重绘
<prefix> r
```

### 鼠标模式

如果需要鼠标支持，可在 `~/.tmux.conf` 添加：

```bash
set -g mouse on
```

### 256 色问题

确保终端支持 256 色：

```bash
echo $TERM
# 应显示 xterm-256color 或 screen-256color
```

## 参考资料

- [Tmux 官方文档](https://github.com/tmux/tmux/wiki)
- [Tmux 使用指南](https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)
- [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)