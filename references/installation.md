# ProbeMe 安装与检查

官方来源：https://github.com/yeaphgel/probe-me

截至本技能编写时，该仓库包含两个相互配合的独立技能：`probe-me/`（面向用户的门控和会话）与 `probing/`（内部探测引擎）。**两个都要安装**。仓库根目录的 README 不是可直接替代 SKILL.md 的技能目录。

## 克隆后安装

```bash
git clone https://github.com/yeaphgel/probe-me.git
# Codex (macOS/Linux)
mkdir -p ~/.codex/skills
cp -R probe-me/probe-me probe-me/probing ~/.codex/skills/
# Claude Code (macOS/Linux)
mkdir -p ~/.claude/skills
cp -R probe-me/probe-me probe-me/probing ~/.claude/skills/
```

Windows PowerShell（在想安装的目录执行）：

```powershell
git clone https://github.com/yeaphgel/probe-me.git
New-Item -ItemType Directory -Force "$HOME\.codex\skills" | Out-Null
Copy-Item -Recurse -Force ".\probe-me\probe-me", ".\probe-me\probing" "$HOME\.codex\skills\"
```

如使用其他兼容代理，把这两个目录复制到**该代理实际扫描的技能目录**，切勿猜测目录。安装完成后，确认 `probe-me/SKILL.md` 和 `probing/SKILL.md` 都存在，并让代理重新发现/刷新技能（必要时重新启动）。

若下载或安装失败，明确报告故障；不得把“给了命令”当作“已经安装”。克隆来源为第三方代码仓库，执行前检查仓库内容与授权。

W7 自身放到同一技能目录下，最终形如：

```text
<skills>/
  w7-concept-deep-dive/SKILL.md
  probe-me/SKILL.md
  probing/SKILL.md
```
