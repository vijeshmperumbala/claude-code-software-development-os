# Repeated fetch or render loop

## Symptom
A component or client repeatedly triggers requests without meaningful state changes.

## Reproduction template
Open the affected screen and monitor request count, renders, and dependencies.

## Expected behavior
Requests occur only when intended; effect dependencies and state transitions are stable.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
