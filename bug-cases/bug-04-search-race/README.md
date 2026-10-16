# Search responses arrive out of order

## Symptom
A slower response for an older query overwrites results for a newer query.

## Reproduction template
Type two distinct queries quickly while simulating different response delays.

## Expected behavior
Only the latest valid query updates results; cancellation or request identity prevents stale updates.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
