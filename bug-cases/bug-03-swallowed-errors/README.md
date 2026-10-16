# Errors are swallowed

## Symptom
A failed operation appears to succeed or fails silently.

## Reproduction template
Force a controlled API/network failure and inspect UI, logs, and returned status.

## Expected behavior
Failures remain observable, users receive a useful safe message, and diagnostics preserve actionable context without exposing secrets.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
