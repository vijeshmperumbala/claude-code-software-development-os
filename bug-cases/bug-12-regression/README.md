# Regression after a change

## Symptom
Previously working behavior breaks after a code, dependency, schema, or configuration change.

## Reproduction template
Compare the failing revision with the last known good behavior and run focused tests.

## Expected behavior
Identify the regression range/cause where possible and add a stable automated regression test.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
