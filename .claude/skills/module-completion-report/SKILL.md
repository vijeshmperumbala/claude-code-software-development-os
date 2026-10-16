---
name: module-completion-report
description: Generate a persistent evidence-based before-and-after report after module implementation and verification.
---
# Module Completion Report

At the end of every orchestrated module implementation, create a report at `docs/reports/<module-slug>-completion-report.md`, unless the user specifies another path.

## Baseline before implementation
- Capture the starting Git status and revision when available; never overwrite or discard unrelated changes.
- Inspect the existing implementation and document baseline behavior.
- Run relevant baseline checks where practical and permitted.
- Record existing test results, known defects, schema/query behavior, performance measurements, and code duplication findings only when evidence is available.
- If a baseline cannot be captured, write `Not measured` and explain why.

## After implementation
- Record delivered workflows, changed files, architecture decisions, migrations, tests and exact commands/results.
- Compare before and after using evidence, not guesses.
- Include best-case/happy-path and relevant edge/failure scenarios.
- Include duplicate-code, database complexity, security, performance, accessibility/device, regression and documentation results when relevant.
- Distinguish measured quantitative improvement from qualitative assessment.
- Report failed, blocked, skipped, and not-run checks honestly.
- Include known issues, trade-offs, risks and deferred work.
- Never fabricate metrics, test coverage, benchmark results, or a prior-state baseline.

## Final status
Use PASS, FAIL, BLOCKED, NOT RUN, or NOT APPLICABLE for each quality area. A report is not a release approval. Production actions still require explicit authorization.
