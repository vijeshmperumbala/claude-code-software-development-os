# Engineering Task Ledger

> Update in place. Preserve task IDs and history. Do not claim an agent ran unless the invocation actually occurred.

- Project: `<name/path>`
- Objective: `<objective>`
- Started: `YYYY-MM-DD`
- Baseline revision/status: `<commit or unavailable>`

| Task ID | Task / acceptance criteria | Owner/agent | Dependencies | Approval | Status | Evidence / result | Retry count |
|---|---|---|---|---|---|---|---|
| ENG-001 | `<task>` | `<owner>` | `None` | `Pending/Approved/Not required` | `NOT STARTED` | `Not run` | `0` |

## Blockers and decisions
- `YYYY-MM-DD` — `<blocker/decision, owner, next action>`

## Final reconciliation
- Planned tasks: `<n>`
- Verified: `<n>`
- Failed: `<n>`
- Blocked: `<n>`
- Not run: `<n>`
- Unaccounted tasks: `0 required`


## Required task fields and lifecycle
Each task should include a stable ID, module, requirement reference, owner, execution mode, approval state, dependencies, acceptance criteria, and evidence. Allowed statuses: `NOT STARTED`, `IN PROGRESS`, `BLOCKED`, `RESOLVED`, `WONT_DO`. `RESOLVED` requires verification evidence. Deployment state is tracked separately. Preserve progress history and re-read before writing when parallel agents may update the ledger.
