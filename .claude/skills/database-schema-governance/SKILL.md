---
name: database-schema-governance
description: Map schema objects to application workflows and identify evidence-based candidates for database cleanup and safe optimization.
---
# Database Schema Governance

## Purpose
Keep the database minimal, consistent, performant, auditable, and aligned with actual product workflows without deleting data based on guesswork.

## Procedure
1. Detect the real database/ORM/migration system and inspect repository instructions.
2. Inventory tables, columns, constraints, indexes, foreign keys, views, triggers, stored procedures, migration history, and seed/test fixtures where discoverable.
3. Trace usage through models/entities, repositories, services, API handlers, UI forms, scheduled/background jobs, reports, raw/dynamic SQL, tests, integrations, and admin tooling.
4. Identify duplicated concepts, unused-looking objects, unreferenced columns, redundant indexes, weak constraints, orphan-risk relations, schema drift, and obsolete workflows.
5. Separate source-code evidence from runtime evidence. For uncertain usage, recommend query logs, database telemetry, access statistics, code search across all repos, or owner confirmation.
6. Check tenant isolation, audit trails, soft deletes, retention obligations, data export, analytics, external consumers, and rollback constraints.
7. Rank findings by severity and confidence. Explain business impact and dependencies.
8. Propose staged, backward-compatible deprecation and removal. Prefer expand-contract migrations and a separate release for destructive removal when appropriate.

## Non-negotiable safety rules
- Audit mode is read-only.
- Never drop tables/columns, delete rows, truncate data, or rewrite migration history.
- Never label a table unused solely because no direct source reference was found.
- Never remove a workflow before checking permissions, reports, jobs, integrations, and data-retention needs.
- Require explicit human approval for implementation and a verified backup/restore plan for destructive changes.

## Output
Schema inventory; table/column-to-workflow map; findings with evidence and confidence; candidates requiring runtime confirmation; staged cleanup plan; migration tests; rollback and monitoring plan; checks not run.
