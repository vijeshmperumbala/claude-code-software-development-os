# Testing Rules

- Derive commands from repository configuration; never invent a successful test result.
- Test expected behavior, edge cases, invalid input, authorization, failure modes, and regressions proportional to risk.
- Keep tests deterministic and avoid hitting real production services.
- Label unrun checks clearly and explain why they were not run.
- A test passing does not by itself establish security, performance, accessibility, or production readiness.
