# Empty state missing or misleading

## Symptom
A list/page with no records does not explain the empty state or the next useful action.

## Reproduction template
Create a new account or use a dataset with zero records; open the relevant list.

## Expected behavior
Show a clear empty state and an appropriate next action; distinguish empty data from loading and errors.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
