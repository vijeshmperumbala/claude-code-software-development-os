---
description: Create or update the evidence-based before-and-after completion report for a module.
---
Use the `module-completion-report` skill and `templates/MODULE_COMPLETION_REPORT.md`.

Inspect available Git revisions, changed files, test output and audit findings. Generate `docs/reports/<module-slug>-completion-report.md`. Compare baseline and final state where evidence exists. Include implemented scope, changed files, test results, duplicate-code/database/security/performance/UI checks, relevant happy-path and edge-case scenarios, known issues, and release readiness.

Do not invent a baseline, metrics, test outcomes, or improvements. Mark missing evidence as NOT MEASURED / NOT RUN and explain. Do not commit or publish the report unless explicitly approved.
