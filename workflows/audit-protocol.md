# Audit Protocol

## Finding schema
- ID: stable within the report (e.g. `SEC-001`)
- Title
- Severity: critical / high / medium / low / info
- Confidence: high / medium / low
- Category and owner agent
- Location: file and line or component/route when available
- Evidence: exact code path, test output, command output or reproducible reasoning
- Impact and realistic abuse/failure scenario
- Recommendation and alternatives
- Verification method and expected result
- Status: open / approved / in-progress / fixed-unverified / verified-fixed / accepted-risk / false-positive

## Severity guidance
- Critical: likely severe compromise, broad data loss, or systemic exposure requiring immediate escalation.
- High: material security, integrity, availability or release risk.
- Medium: meaningful defect with bounded impact or a likely exploitable weakness under specific conditions.
- Low: limited impact, hardening or maintainability issue.
- Info: observation or improvement with no demonstrated direct impact.

Adjust to the organization's policy and document the rationale. Severity is not the same as confidence.

## Deduplication
Merge reports about the same root cause while preserving affected paths and agent perspectives. Do not merge distinct vulnerabilities merely because they share a category.

## Evidence rules
Do not report a tool execution without its output. A code-inspection hypothesis is not a reproduced exploit. A clean scan only describes the scan's scope and coverage.
