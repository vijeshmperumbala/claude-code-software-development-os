# List does not refresh after mutation

## Symptom
A create/update/delete succeeds but the visible list remains stale.

## Reproduction template
Change a record, return to the list, and inspect data and counts.

## Expected behavior
The UI reflects the confirmed server state without requiring a full reload; no optimistic state is presented as saved before confirmation.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
