---
name: audit-reverification-workflow
description: Independently verify previously remediated findings.
---

# Re-audit workflow

1. Require finding IDs or the prior audit report.
2. Inspect the code diff and test evidence for each finding.
3. Reproduce or run the defined verification method when safe and available.
4. Return each item as `VERIFIED_FIXED`, `NOT_FIXED`, `PARTIALLY_FIXED`, `UNVERIFIED`, or `REGRESSION_FOUND` with evidence.
5. Run focused independent review where useful; do not rely only on the implementation agent's assertion.
