---
name: project-initialization-workflow
description: Initialize or assess a project repository using its existing technology stack.
---

# Project initialization workflow

1. Inspect git status and existing instructions first; do not overwrite user work.
2. Inventory repository files, package/build manifests, lockfiles, CI, tests, migrations, environment examples, and deployment setup.
3. Detect languages, frameworks, runtime versions, package managers, database, test/lint/type-check/build commands, supported platforms, and confidence. Cite the evidence for each inference.
4. If the repo is non-empty, preserve conventions. If empty, ask for essential missing decisions or propose a minimal scaffold for approval.
5. Use `project-initializer-agent`, `requirements-agent`, `architecture-agent`, and `documentation-agent` as needed.
6. Propose only relevant docs: README, PRD/product brief, architecture overview/ADRs, local setup, testing guide, security notes, and roadmap.
7. Report detected stack, unknowns, proposed changes, risks, exact checks, and request approval before scaffolding or broad edits.
8. Do not install packages, alter CI, create remote resources, or modify production config without approval.
