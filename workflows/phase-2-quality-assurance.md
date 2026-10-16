# Phase 2 — Quality Assurance and Audit Integrity

## Required quality process
1. Capture a baseline before modifications: current test results, existing audit findings, repository status, and relevant performance measures where available.
2. Give findings stable IDs and record severity, confidence, evidence, affected component, reproduction steps, remediation, and verification status.
3. Distinguish `NEW`, `PRE-EXISTING`, `FIXED`, `REOPENED`, `ACCEPTED RISK`, and `DUPLICATE` findings.
4. Use an independent reviewer for high-risk changes; the implementation author cannot be the sole acceptance authority.
5. Re-run targeted tests and relevant audits after changes. Run broader regression checks for shared code, migrations, auth, permissions, and public API changes.
6. A resolved item requires verification evidence. Deployment is a separate state and must never be inferred from local tests or a merged change.
7. Accepted risks require rationale, owner, review/expiry date, and explicit approval where required.
8. Preserve baseline history. Never delete prior findings just because they no longer reproduce; mark them fixed with evidence.

## Minimum report
Baseline date/commit; finding ID; baseline/current state; severity; evidence; changed files; checks executed; check results; residual risks; accepted exceptions.

## Acceptance gate
No fabricated results, no silent baseline reset, and no unverified `Resolved` status.
