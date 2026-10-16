---
description: Create an approval-ready, reversible plan to retire unused database objects or obsolete workflows without applying changes.
---
Use `database-governance-agent` findings as input. Do not proceed from unverified assumptions.

Prepare a plan containing:
- Candidate table/column/index/workflow and evidence
- Current and indirect consumers, including scheduled tasks, reporting, analytics, integrations, and dynamic access
- Business/data owner confirmation required
- Runtime usage/telemetry needed and observation window
- Backup/restore and data-retention checks
- Compatibility/deprecation stages and expand-contract migration where applicable
- Data validation, migration tests, rollback/forward-fix strategy, monitoring, and release sequencing
- Explicit approval checklist

Do not execute SQL, change migrations, delete data, or alter workflows. Stop and flag any candidate without sufficient evidence or recovery plan.
