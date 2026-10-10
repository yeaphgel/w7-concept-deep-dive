# W7 Concept Deep Dive

**Clarify language · Probe assumptions · Upgrade viewpoints**  
**W7｜概念深潜：澄清语言 · 探测前提 · 升级观点**

[简体中文](README.zh-CN.md) · [Core skill](SKILL.md) · [ProbeMe dependency](https://github.com/yeaphgel/probe-me)

W7 is a **Wittgenstein-inspired concept analysis skill** for AI assistants. It helps turn fuzzy terms, sweeping claims, personal narratives, and emerging theories into clearer ideas with meaningful distinctions and explicit boundaries.

Rather than generating deeper-sounding jargon, W7 asks whether a revised concept actually improves our ability to **distinguish, explain, predict, or judge** something in the real world. A valuable output may be a concise **viewpoint card**, an audit of a claim, or simply a better question—not necessarily a plan.

## What it does

- **Clarify words in use:** identify language games, category shifts, and ambiguity.
- **Audit ideas with W7:** apply seven selective checks to assumptions, logic, reification, and conceptual value.
- **Upgrade viewpoints:** distinguish concepts that were previously conflated; preserve counterexamples and scope limits.
- **Check self-deception:** separate observed facts from identity stories and comforting explanations, without pretending to diagnose psychology.
- **Delegate consequential assumption probes to ProbeMe:** use the external `probe-me` / `probing` skills under their *own* consent and stopping rules.

## How W7 and ProbeMe work together

```text
Your concept or claim
       ↓
W7: clarify language and identify load-bearing assumptions
       ↓ (only when warranted; external skill)
ProbeMe: probe user-specific evidence and high-stakes uncertainty
       ↓ (stops with its own probe-ledger)
W7: reassess and upgrade a concept only upon a new user request
       ↓
A viewpoint card, conceptual audit, or open question
```

**No fake invocation:** W7 does not copy or emulate ProbeMe internally. During a ProbeMe session, its one-question rhythm, permission before adversarial challenge, and requirement to stop after the assumption ledger take precedence. Routine, low-risk concept clarification can be completed without starting a ProbeMe session.

## Installation

Install W7 into your agent's skill directory (for example, `~/.codex/skills/w7-concept-deep-dive/`). For full integration, also install **both** skills from [yeaphgel/probe-me](https://github.com/yeaphgel/probe-me):

```bash
git clone https://github.com/yeaphgel/probe-me.git
mkdir -p ~/.codex/skills
cp -R probe-me/probe-me probe-me/probing ~/.codex/skills/
```

Windows PowerShell:

```powershell
git clone https://github.com/yeaphgel/probe-me.git
New-Item -ItemType Directory -Force "$HOME\.codex\skills" | Out-Null
Copy-Item -Recurse -Force '.\probe-me\probe-me', '.\probe-me\probing' "$HOME\.codex\skills\"
```

See [installation details](references/installation.md) for other environments and dependency checking. If ProbeMe is unavailable, W7 reports that honestly rather than claiming a complete integration.

## Example prompts

- “Use W7 to dive into the concept of **customer acquisition** and create a viewpoint card.”
- “Audit this claim: **AI will replace every employee**.”
- “I am an idealist, so I cannot run a business. **Check this for self-deception**.”
- “Examine my new theory. **What does it reveal that existing concepts do not?**”
- “Before making this costly decision, **use W7 and ProbeMe to test its assumptions**.”

## Files

| Path | Purpose |
| --- | --- |
| [`SKILL.md`](SKILL.md) | Main skill behavior and routing |
| [`references/w7-method.md`](references/w7-method.md) | Seven-question conceptual audit |
| [`references/concept-upgrade.md`](references/concept-upgrade.md) | Viewpoint-upgrade quality criteria |
| [`references/probe-handoff.md`](references/probe-handoff.md) | External ProbeMe handoff contract |
| [`references/output-cards.md`](references/output-cards.md) | Output patterns |
| [`references/installation.md`](references/installation.md) | Setup and prerequisites |
| [`examples/试运行.md`](examples/试运行.md) | Chinese example walkthrough |

## Publishing and rights

The repository can be publicly visible without automatically granting an open-source license. **No license is included in this initial release.** Contact the repository owner for permissions beyond viewing and applicable platform terms.

Version: **0.4.0** · Maintainer: **YEAPHGEL**

## Publish to GitHub

The repository owner can authenticate with `gh auth login` and then run on Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\publish-github.ps1
```

This script creates/updates a **public** `yeaphgel/w7-concept-deep-dive` repository, sets the bilingual GitHub description, commits, and pushes these files. It cannot authenticate to your account on your behalf.
