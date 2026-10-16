# TODO and Task Ledger Lifecycle

## Single ownership and update rules
- Keep module-specific `TODO.md` files and the shared task ledger; do not replace one with the other. TODO is the human-readable module backlog; the ledger coordinates active multi-agent work.
- Preserve stable IDs, completed items, timestamps, and progress history. Never silently delete or rewrite unrelated entries.
- Every task has module, description, priority, owner, dependencies, approval state, acceptance criteria, verification evidence, and status.
- Statuses: `OPEN`, `IN_PROGRESS`, `BLOCKED`, `RESOLVED`, `WONT_DO`. `RESOLVED` requires acceptance evidence; deployment is tracked separately. `WONT_DO` requires rationale and user/owner acceptance when material.
- Before edits, read the existing TODO and ledger, deduplicate by ID and root cause, and check for concurrent updates. Re-read before writing if other agents may have changed the same file.
- Add dated progress notes; keep prior history. If evidence is unavailable, use `NOT RUN` or `BLOCKED`, never infer success.
- Reconcile task counts at completion: planned = resolved + open/in-progress + blocked + wont-do, with no unaccounted tasks.
