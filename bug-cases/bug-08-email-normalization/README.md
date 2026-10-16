# Inconsistent email normalization

## Symptom
Email comparison, uniqueness, or lookup behaves inconsistently across casing and whitespace.

## Reproduction template
Test leading/trailing whitespace and case variants against the product's documented email policy.

## Expected behavior
Normalization is consistent at the correct boundaries and aligns with identity/security policy; do not alter valid address semantics without requirements.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
