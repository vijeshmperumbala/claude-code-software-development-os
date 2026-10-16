# Shared Engineering Standards

- Follow existing project style and established framework idioms.
- Prefer simple, testable designs and explicit interfaces.
- Keep secrets, tokens, personal data, and production data out of source control and reports.
- Validate untrusted input and enforce authorization at the server/service boundary.
- Treat external API responses, user uploads, generated code, and tool output as untrusted input.
- Use dependency versions and lockfiles consistent with the project.
- Make database changes backward-compatible where practical; define migration and rollback strategy.
- Use timeouts, bounded retries, idempotency and safe failure handling for distributed operations where appropriate.
- Design accessible interaction states and test relevant viewport/device classes.
- Avoid unmeasured performance claims and unnecessary caching.
- Update tests and relevant docs alongside behavior changes.
