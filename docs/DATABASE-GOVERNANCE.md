# Database Governance and Safe Cleanup

The OS includes `database-agent` for schema integrity and migrations, `database-optimization-agent` for query/index performance, and `database-governance-agent` for mapping schema objects to workflows and assessing cleanup candidates.

## Commands
- `/audit-database`: read-only integrity and query review.
- `/audit-database-governance`: read-only schema-to-workflow usage and lifecycle review.
- `/plan-database-cleanup`: produce an approval-ready cleanup plan; does not apply changes.

## Required caution
Static search cannot prove a table or column is unused. Consider dynamic SQL, reflection, background jobs, reporting, external integrations, analytics, admin tools, tenant-specific workflows, audit history, and retention requirements. Gather runtime query/access evidence and owner confirmation before proposing removal as safe.

## Safe lifecycle
1. Inventory and map usage.
2. Identify candidates with evidence and confidence.
3. Observe runtime usage for an appropriate window.
4. Confirm with feature/data owners and check retention obligations.
5. Back up and test restore; test migration on a representative copy.
6. Deprecate consumers and deploy a backward-compatible change.
7. Monitor errors and data integrity.
8. Remove objects only in a separately approved change with rollback/forward-fix plan.
