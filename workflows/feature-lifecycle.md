# Feature Lifecycle

## Plan
- Define user outcome, non-goals, acceptance criteria, edge cases, permissions, data/API changes, UI states, accessibility, device support and rollout/rollback.
- Identify owner modules and impacted contracts.
- Obtain approval for material design decisions.

## Build
- Implement the smallest coherent change.
- Add tests and documentation with the code.
- Keep parallel work separated by file/module ownership.

## Verify
- Run relevant unit/integration/contract/E2E checks discovered from project configuration.
- Run security, accessibility, device, performance, migration or reliability checks when risk warrants.
- Review the diff and confirm no unrelated changes.

## Close
- Map each acceptance criterion to evidence.
- Record unrun checks and known limitations.
- Request approval before deployment or other consequential actions.
