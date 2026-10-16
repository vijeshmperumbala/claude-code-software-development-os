---
name: engineering-state-management
description: Maintain persistent task ledgers, module TODOs, audit baselines, project maps, and completion evidence without losing history.
---
# Engineering State Management

Use this skill for multi-agent or multi-step engineering work.

1. Inspect existing state artifacts before creating new ones.
2. Use `templates/AGENT-TASK-LEDGER.md` for complex work, `templates/AUDIT-BASELINE.md` for audits, `templates/PROJECT-MAP.md` for project discovery, and `templates/AGENT-RESULT.md` for delegated output.
3. Maintain module-wise `TODO.md` files as the actionable backlog. Do not replace an existing TODO wholesale.
4. Preserve stable IDs, completed items, dated notes, and historical findings. Merge duplicates only when evidence shows they are the same issue; preserve aliases/source references.
5. Update status only to match reality. `Resolved` means verified; `Deployed` requires separate deployment evidence.
6. Store paths, line references, test commands/output summaries, and decisions as evidence. Never invent evidence.
7. For concurrent work, designate one writer for each shared state file or have agents return proposed changes to the main session for consolidation.
8. Final reports reconcile the plan, ledger, TODOs, verification results, and unresolved risks.


## Lifecycle invariants
- Preserve stable task IDs and progress history; never silently overwrite unrelated TODO entries.
- Record approval state and execution mode on delegated tasks.
- `RESOLVED` requires evidence against acceptance criteria; deployment is a separate field/state.
- Record actual agent invocation and result; do not infer dispatch from a plan.
- Reconcile all planned tasks and identify blocked/not-run tasks explicitly.
- Re-read shared state before writes when parallel work may have changed it.
