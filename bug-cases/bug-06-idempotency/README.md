# Duplicate operation on retry

## Symptom
Retries or repeated clicks create duplicate records or trigger duplicate side effects.

## Reproduction template
Repeat a submission or retry after a simulated timeout where the server may have processed it.

## Expected behavior
The operation is safely idempotent where required; duplicate side effects are prevented or explicitly handled.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
