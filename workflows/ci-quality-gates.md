# CI Quality Gates

Quality gates must be adapted to detected stack and repository CI. Recommended categories: format/lint, type/static checks, unit tests, integration tests, E2E tests, security/dependency/license checks, build/package, migration compatibility, and release smoke tests.

For each gate record applicability, command or workflow, result, evidence, and limitation. Results are `PASS`, `FAIL`, `BLOCKED`, `NOT RUN`, or `NOT APPLICABLE`. Required failed/blocked gates prevent a success claim. Never fabricate CI output. Existing CI conventions should be extended, not replaced without approval.
