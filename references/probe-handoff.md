# W7 → ProbeMe 交接契约

## 必需输入

```yaml
user_quote: 用户原话，不篡改
restatement: W7 善意准确的命题
confirmed_facts: 已被用户或外部资料支持的事实
assumptions: 尚未确认的承重前提
conceptual_ambiguity: W7 识别的混淆
probe_goal: 此次只需要探明的一项高价值未知
prior_ledger: 如有，传递上一轮 probe-ledger
```

## 调用与返回

1. 读外部 `probe-me/SKILL.md`；遵守其选择性门控和用户意愿。
2. `probe-me` 负责调用 `probing`；不把完整方法学复制进 W7。
3. 按其正式规则一次一个问题、提供推荐假说；对抗阶段必须获得明确许可。
4. 完成后获得可携带 `probe-ledger`，包括锁定事实、可证伪假设、杀伤力、证伪信号和本周一个测试。
5. 立刻停止 ProbeMe 会话。**绝不在同一阶段自动继续写计划或 W7 升级卡。** 用户下一次授权/要求概念升级时，W7 把账本当输入，仍区分事实与假设。

不能调用时，报告“未调用 ProbeMe”，提供官方仓库安装步骤。切勿伪造账本或权限。
