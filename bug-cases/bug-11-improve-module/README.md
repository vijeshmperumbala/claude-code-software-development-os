# Module improvement / edge-case review

## Symptom
A module works for the happy path but misses error, permission, empty, loading, boundary, or recovery states.

## Reproduction template
Review the module against requirements and exercise its main and failure paths.

## Expected behavior
Produce evidence-based findings, prioritized gaps, acceptance criteria, and a scoped improvement plan before broad refactoring.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
