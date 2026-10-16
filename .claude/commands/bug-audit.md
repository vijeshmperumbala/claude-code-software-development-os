---
description: Audit a reported bug from reproduction through root-cause analysis, regression coverage, and verification. Does not apply fixes unless explicitly approved.
---
Follow the bug-audit skill and shared agent contract.

1. Ask for or locate expected behavior, actual behavior, reproduction steps, affected version, logs, and relevant files.
2. Reproduce the issue where possible. If it cannot be reproduced, report the missing evidence rather than guessing.
3. Trace the code path and identify the root cause, impact, severity, and related edge cases.
4. Delegate independent review to the relevant domain agents (API, frontend, database, security, concurrency, reliability, or testing).
5. Propose a minimal fix and regression tests. Do not modify files until the user approves the implementation plan.
6. Report evidence, affected files, risks, and exact verification commands. Mark unrun checks as NOT RUN.
