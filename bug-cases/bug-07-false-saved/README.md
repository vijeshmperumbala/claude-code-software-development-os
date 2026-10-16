# UI reports saved before persistence succeeds

## Symptom
The interface displays success even when persistence fails or is not confirmed.

## Reproduction template
Submit a change while forcing a server validation or persistence error.

## Expected behavior
Success appears only after confirmation; pending, failed, and retry states are distinct.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
