---
name: ci-quality-gates
description: ## Purpose
---

# CI Quality Gates Skill

## Purpose
Make quality checks repeatable and evidence-based.

## Workflow
1. Detect existing CI provider and conventions; do not replace them without approval.
2. Map checks by risk: formatting/lint, type/static analysis, unit, integration, E2E, security, dependency/license, build/package, migration validation.
3. Distinguish required, conditional, and informational gates.
4. Record exact command/workflow, exit status, timestamp or run URL if available, and artifact/evidence.
5. If a check was not run, label it `NOT RUN`; if infrastructure prevented it, label it `BLOCKED`.
6. Do not edit branch protections, secrets, release environments, or production workflows without explicit approval.
