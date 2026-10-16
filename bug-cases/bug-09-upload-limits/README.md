# Upload size/type limits inconsistent

## Symptom
Client and server disagree about allowed size, type, or count, or server validation is bypassable.

## Reproduction template
Test allowed and disallowed file types, boundary sizes, multiple files, and forged content types in a safe test environment.

## Expected behavior
Server-side limits are authoritative; rejected uploads are safe, clear, and do not leave orphaned or partial data.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
