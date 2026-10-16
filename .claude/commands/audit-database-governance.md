---
description: Audit schema usage, table/column lifecycle, duplicate models, and obsolete workflows; read-only, no cleanup applied.
---
Invoke `database-governance-agent`, `database-agent`, and `database-optimization-agent` with distinct responsibilities. Follow the database-schema-governance skill.

1. Inventory schema objects and migration history.
2. Trace tables/columns to application workflows, APIs, jobs, reports, tests, and integrations.
3. Review integrity, duplication, indexes, query patterns, and data lifecycle.
4. Mark uncertain candidates as requiring runtime evidence; absence of source references is not proof of non-use.
5. Produce a prioritized report and staged cleanup plan.
6. Do not change code, run destructive SQL, edit migrations, or delete database objects. Ask for explicit approval before any implementation.
