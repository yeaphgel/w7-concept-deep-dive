# W7｜概念深潜

**澄清语言 · 探测前提 · 升级观点**

[English（英文）](README.md) · [技能主文件](SKILL.md) · [ProbeMe（前提探测技能）仓库](https://github.com/yeaphgel/probe-me)

**W7 是一套借鉴维特根斯坦语言哲学的人工智能认知技能。** 它帮助用户把含混的概念、笼统的判断、关于自己的叙事以及尚未成熟的原创理论，转化成有边界、有区分力、能够接受现实检验的思想成果。

它不追求制造听起来深刻的新名词。真正的概念升级应该让我们**看见过去没有区分的事物、理解可能的机制、明确适用边界**。输出可以是一张**观点卡片**、一份概念审计、一个思想命题，或者一个比原来更准确的问题，不必强求行动方案。

## 它能做什么

- **澄清语言：** 检查同一个词在不同语境中的含义，以及事实、价值和身份判断之间的偷换。
- **W7 七问审计：** 选择性检查语言游戏、普通话翻译、使用边界、推理跳跃、抽象概念实体化、隐藏铰链与思想增量。
- **升级概念：** 找到过去被混用的关键区别，提出更清楚、带有证据等级与反例边界的新认识。
- **识别自我欺骗：** 区分观察与解释、人格标签与命运、沉没成本与未来价值，不擅自进行心理诊断。
- **调用外部 ProbeMe（前提探测）技能：** 面对重要决策或关键证据缺口时，将探测交给独立安装的 `probe-me` 和 `probing`，不复制其内部引擎。

## 与 ProbeMe 如何协作

```text
用户输入概念或判断
       ↓
W7：澄清语言，识别承重前提
       ↓（必要时，调用外部技能）
ProbeMe：追问用户独有事实与重大未知
       ↓（按其原生规则生成假设账本并停止）
用户明确要求继续后，W7 才根据账本重新审计并升级观点
       ↓
观点卡片 / 概念审计 / 开放性问题
```

**尊重外部技能边界：** ProbeMe 原生规定一次只问一个实质问题，对抗性审查前征得同意，完成假设账本后停止。W7 不应冒充已调用技能，也不会在 ProbeMe 尚未结束时擅自生成战略方案。普通、低风险的概念解释不必每次启动 ProbeMe 完整会话。

## 安装

将 `w7-concept-deep-dive` 整个目录放入智能体技能目录，例如：

```text
~/.codex/skills/w7-concept-deep-dive/SKILL.md
```

完整联动需要提前安装以下两个外部技能（**缺一不可**）：

- `probe-me`：面向用户的会话与权限管理。
- `probing`：底层假设探测引擎。

来源：https://github.com/yeaphgel/probe-me

Windows PowerShell 安装外部依赖：

```powershell
git clone https://github.com/yeaphgel/probe-me.git
New-Item -ItemType Directory -Force "$HOME\.codex\skills" | Out-Null
Copy-Item -Recurse -Force '.\probe-me\probe-me', '.\probe-me\probing' "$HOME\.codex\skills\"
```

安装完成后的目录应为：

```text
.codex/skills/
├── w7-concept-deep-dive/
│   └── SKILL.md
├── probe-me/
│   └── SKILL.md
└── probing/
    └── SKILL.md
```

其他环境请参考[安装说明](references/installation.md)。如果环境不能识别 ProbeMe，W7 应如实提示安装，不能伪称已经完成联动。

## 使用示例

> 用 W7 深潜「获客」，不要直接给营销方案，先找出这个概念忽略了什么，再输出观点卡。

> 用 W7 审计「我是理想主义者，所以不适合做商业」。

> 用 W7 分析我的「活器理论」，它相比既有概念究竟增加了什么区分？

> 对我准备投入的项目使用 W7，必要时调用 ProbeMe 深入探测前提。

## 关键文件

| 文件 | 作用 |
| --- | --- |
| [`SKILL.md`](SKILL.md) | 技能入口与完整运行规则 |
| [`references/w7-method.md`](references/w7-method.md) | 维特根斯坦式七问审计 |
| [`references/concept-upgrade.md`](references/concept-upgrade.md) | 概念升级与思想增量检查 |
| [`references/probe-handoff.md`](references/probe-handoff.md) | 与 ProbeMe 的交接规则 |
| [`references/output-cards.md`](references/output-cards.md) | 观点卡片与报告模板 |
| [`references/installation.md`](references/installation.md) | 安装与依赖检查 |
| [`examples/试运行.md`](examples/试运行.md) | 运行示例 |

## 公开与授权

**仓库公开（Public）不等于授予开源许可。** 当前初版未附加开源许可证；涉及复制、修改、分发或商业使用的许可，请联系项目所有者。

**版本：V0.4.0｜维护者：YEAPHGEL**

## 发布到 GitHub

仓库所有者在装有 Git 与 GitHub 命令行工具（`gh`）的 Windows 电脑上，先运行 `gh auth login` 完成本人授权，再在本目录执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\publish-github.ps1
```

脚本将以 `yeaphgel` 账号建立 `w7-concept-deep-dive` **公开仓库**、设置双语仓库简介，并提交本目录文件。若仓库已存在，则尝试同步与更新公开设置。发布脚本不会代替使用者执行 GitHub 身份认证。
