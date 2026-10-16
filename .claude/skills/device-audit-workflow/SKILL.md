---
name: device-audit-workflow
description: Audit the product against its declared device/platform support matrix.
---

# Device and UX audit

1. Discover the documented target browsers, operating systems, screen classes, input modes, and minimum versions. If missing, report this as a blocker/assumption.
2. Inspect responsive behavior, overflow/reflow, keyboard and focus, touch interaction, zoom/text scaling, accessibility, loading/error/empty states, offline/network behavior and performance where applicable.
3. Delegate to responsive-design-agent, device-compatibility-agent, frontend-agent, accessibility-agent, ux-research-agent and resource-efficiency-agent.
4. Distinguish source inspection from actual browser/device testing. Do not claim real-device verification without test evidence.
5. Return a matrix of target × check × result × evidence × gap.
