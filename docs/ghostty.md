# Ghostty + Claude Code 最佳实践

> Ghostty 是一款原生、GPU 加速的终端模拟器，内置分屏、标签页管理，无需 tmux 即可打造高效的 Claude Code 工作环境。

## 核心快捷键速查

| 快捷键 | 功能 | 使用场景 |
|--------|------|----------|
| `Cmd + D` | 右侧分屏 | 左边 Claude 写代码，右边 debug |
| `Cmd + Shift + D` | 下方分屏 | 上面编辑，下面跑测试 |
| `Cmd + Shift + Enter` | 放大/恢复当前屏幕 | 看 Claude 长输出时切换 |
| `Cmd + W` | 关闭当前分屏 | 清理不需要的面板 |
| `Cmd + Shift + ,` | 重载配置 | 改完主题或分屏后必按 |
| `Cmd + Q` | 完全退出 Ghostty | 重启推荐用这个 |

## 分屏（无需 tmux）

```
Cmd + D          → 水平分屏（右侧新建终端）
Cmd + Shift + D  → 垂直分屏（下方新建终端）
Cmd + [ / ]      → 切换分屏焦点（或鼠标点击）
Cmd + W          → 关闭当前分屏
```

自定义分屏样式（在 Ghostty 配置文件中添加）：

```
split-divider-size = 2px
split-divider-color = #3b4252
```

## 标签页管理

```
Cmd + T              → 新建标签页
Cmd + 1 ~ Cmd + 9    → 切换到第 1-9 个标签
Cmd + Shift + [ / ]  → 前后切换标签
Cmd + Shift + W      → 关闭标签页
```

## 搜索与历史

```
Cmd + F              → 开启搜索（支持正则、大小写切换）
Cmd + Shift + F      → 切换大小写敏感
Cmd + ↑              → 跳到历史开头
Cmd + ↓              → 跳到历史结尾
```

历史记录大小配置：

```
scrollback-limit = 10000
```

## 主题

推荐主题：

| 主题 | 风格 |
|------|------|
| `catppuccin-mocha` | 深色，柔和（推荐） |
| `dracula` | 深色，经典 |
| `nord` | 深色，冷色调 |
| `gruvbox` | 暖色调 |
| `tokyo-night` | 深色，现代 |
| `one-dark` | 深色，Atom 风格 |

切换方式：修改配置文件中的 `theme = <主题名>`，保存后 Ghostty 自动重载。

查看所有可用主题：

```bash
ghostty +list-themes
```

## Claude Code 工作布局

### 布局一：编码 + 调试

```
Cmd + D 水平分屏，形成左右布局：

┌──────────────────┬──────────────────┐
│                  │                  │
│   Claude Code    │   vim / 文件浏览  │
│   (主工作区)      │   (参考代码)      │
│                  │                  │
├──────────────────┴──────────────────┤
│          Cmd + Shift + D            │
│          测试 / 日志输出              │
│          pytest tests/              │
└─────────────────────────────────────┘
```

操作步骤：

```bash
# 1. 左侧：启动 Claude Code
claude

# 2. Cmd + D 右侧分屏：查看文件
vim src/main.py

# 3. Cmd + Shift + D 下方分屏：运行测试
pytest tests/
```

### 布局二：多项目管理

```
标签页 1 (Cmd + 1)：项目 A
标签页 2 (Cmd + 2)：项目 B
标签页 3 (Cmd + 3)：文档编辑
```

操作步骤：

```bash
# 标签页 1：项目 A
cd ~/projects/A && claude

# Cmd + T 新建标签页 2：项目 B
cd ~/projects/B && claude

# Cmd + T 新建标签页 3：文档
vim README.md
```

### 布局三：Claude Code + 实时预览

```
┌──────────────────┬──────────────────┐
│                  │                  │
│   Claude Code    │   dev server     │
│                  │   (npm run dev)  │
│                  │                  │
└──────────────────┴──────────────────┘
```

左边让 Claude 改代码，右边实时看 dev server 输出，配合浏览器预览效果。

## 实用技巧

1. **看长输出** — Claude 输出很长时，`Cmd + Shift + Enter` 全屏查看，再按恢复
2. **快速切换** — 用 `Cmd + [` / `Cmd + ]` 在分屏间快速跳转，不用碰鼠标
3. **历史回溯** — `Cmd + ↑` 快速回到 Claude 之前的输出，配合 `Cmd + F` 搜索关键内容
4. **配置热更新** — Ghostty 支持保存即生效，改主题不用重启
5. **分屏比例** — 拖动分割线调整各面板大小，给 Claude 更多空间
