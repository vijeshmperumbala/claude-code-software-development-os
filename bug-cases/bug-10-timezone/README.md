# Date/time shifts across time zones

## Symptom
Dates, deadlines, or scheduled events shift incorrectly across local zones or daylight-saving transitions.

## Reproduction template
Test known timestamps in UTC and supported local zones, including date boundaries and DST where applicable.

## Expected behavior
Storage, API representation, display zone, and date-only semantics are explicit and consistent.

## Investigation checklist
- [ ] Capture actual versus expected behavior and environment/version.
- [ ] Reproduce or record why reproduction is blocked.
- [ ] Identify root cause with code/log/test evidence.
- [ ] Check permissions, data integrity, error states, and adjacent edge cases.
- [ ] Propose the smallest safe fix and a regression test.
- [ ] Obtain approval before implementation.
- [ ] Verify fix and relevant regressions; mark unrun checks honestly.
