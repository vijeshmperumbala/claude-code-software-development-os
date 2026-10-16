# Agent Expansion — Change Log

- Added 12 specialist agent definitions.
- Registered all new agents in `agents-manifest.json` and recalculated `agent_count`.
- Also registered the existing `database-governance-agent.md`, which was present on disk but missing from the manifest.
- Connected the specialists to `engineering-orchestrator-agent.md` with explicit impact-based routing.
- Added a review matrix, invocation ledger, and acceptance gates to `workflows/agent-orchestration.md`.
- Updated the README and command reference.
- Existing agents, legacy audit agents, commands, skills, and safety defaults were preserved.
- Validation confirms manifest/file consistency and archive integrity; no claim is made that Claude Code runtime execution was tested.

## Phase 1–4 implementation

- Phase 1: Added bounded task-ledger guidance, normalized agent result records, retry/failure handling, and final task reconciliation.
- Phase 2: Added audit-baseline templates, stable finding state transitions, independent review expectations, and evidence-based resolution gates.
- Phase 3: Added evidence-backed project maps, module dependency/impact guidance, and architecture decision recording guidance.
- Phase 4: Added risk-based agent routing, safe parallelism, measurable-efficiency guidance, feature-flag lifecycle controls, and release/rollback safeguards.
- Added `/validate-os`, `/architecture-map`, `/audit-diff`, and `/agent-efficiency-review` commands plus the `engineering-state-management` skill.
- Added `scripts/validate_os.py`; local structural validation passed 210 checks. This does not substitute for live Claude Code runtime testing.
