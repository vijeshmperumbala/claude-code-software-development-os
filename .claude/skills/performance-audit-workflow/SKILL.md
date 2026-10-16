---
name: performance-audit-workflow
description: Find and prioritize performance issues using evidence.
---

# Performance audit

1. Establish the target workload, platform, and performance objective if known.
2. Inspect likely hotspots, database query patterns, frontend bundles/rendering, network calls, concurrency and resource usage.
3. Prefer available profiler, query plan, bundle analyzer, benchmark, or load-test evidence. Do not invent baseline numbers.
4. Delegate to performance-agent, database-optimization-agent, caching-agent, concurrency-agent, scalability-agent, load-testing-agent and resource-efficiency-agent as relevant.
5. Recommend changes by expected impact, confidence, risk, and measurement plan. Do not modify code unless separately approved.
