# Module Completion Report: {{MODULE_NAME}}

- **Project:** {{PROJECT_NAME}}
- **Report date:** {{DATE}}
- **Branch / revision before:** {{BASELINE_REVISION}}
- **Revision after:** {{FINAL_REVISION}}
- **Status:** {{PASS_FAIL_BLOCKED}}
- **Approval:** {{APPROVAL_STATUS}}

## 1. Executive summary
Describe what was requested, what was delivered, major outcomes, and unresolved risks. Do not claim improvements without evidence.

## 2. Before vs. after
| Area | Before / baseline | After | Evidence / command | Status |
|---|---|---|---|---|
| User workflows | | | | |
| Architecture / reuse | | | | |
| Duplicate logic | | | | |
| Database schema / complexity | | | | |
| Query performance | | | | |
| Security / authorization | | | | |
| Tests and coverage | | | | |
| UI/UX and accessibility | | | | |
| Device compatibility | | | | |
| Performance / resource use | | | | |
| Documentation / operations | | | | |

Use “not measured” when no baseline exists. Do not fabricate before/after metrics.

## 3. Delivered scope
List implemented user stories and acceptance criteria with their status.

## 4. Files and components changed
| File / component | Change | Reason | Risk / migration note |
|---|---|---|---|

## 5. Quality checks
| Check | Result: PASS / FAIL / BLOCKED / NOT RUN / N/A | Evidence / command | Notes |
|---|---|---|---|
| Unit tests | | | |
| Integration tests | | | |
| End-to-end / regression | | | |
| Lint / formatting / type checks | | | |
| Security review | | | |
| Database review | | | |
| Duplicate-code review | | | |
| Performance checks | | | |
| Accessibility / device checks | | | |
| Build / deployment checks | | | |

## 6. Best-case and edge-case scenarios
| Scenario | Expected behavior | Test/evidence | Result |
|---|---|---|---|
| Normal happy path | | | |
| Empty state | | | |
| Invalid input / validation | | | |
| Unauthorized access | | | |
| Network or dependency failure | | | |
| Duplicate submission / retry | | | |
| Concurrent updates | | | |
| Boundary values | | | |
| Large dataset / performance | | | |
| Recovery / rollback | | | |

Include only scenarios relevant to the module. Clearly mark scenarios not tested.

## 7. Improvements and trade-offs
Separate measured improvements from qualitative improvements. Include rejected alternatives and why the selected approach fits the existing project.

## 8. Known issues and deferred work
| Finding | Severity | Impact | Recommended action | Owner / approval |
|---|---|---|---|---|

## 9. Database and migration safety (if applicable)
Document schema changes, migration commands, data impact, backup assumptions, rollback steps, and whether migrations were actually tested. Do not execute destructive cleanup without explicit approval.

## 10. Final readiness
- Requirements: PASS / FAIL / BLOCKED / NOT RUN
- Tests: PASS / FAIL / BLOCKED / NOT RUN
- Security: PASS / FAIL / BLOCKED / NOT RUN
- Performance: PASS / FAIL / BLOCKED / NOT RUN
- Documentation: PASS / FAIL / BLOCKED / NOT RUN
- Release readiness: PASS / FAIL / BLOCKED / NOT RUN

## 11. Evidence and limitations
List exact commands, output locations, revisions, unavailable environments, assumptions, and checks that could not be performed.

## 12. Approval and next steps
State what requires user approval. Never imply commit, push, deployment, or production change happened unless confirmed.
