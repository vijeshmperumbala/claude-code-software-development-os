# Claude Code Integration Guide

This guide explains how to install and verify the Software Development OS in a real Claude Code project. It is intentionally approval-first. Package validation does **not** prove that agents, slash commands, or skills execute successfully in your installed Claude Code version.

## 1. Before you begin

- Install and sign in to Claude Code using the official instructions for your operating system.
- Choose a repository you are authorized to inspect and modify.
- Use a disposable test repository first. Do not start with a production checkout or a repository containing uncommitted work you cannot lose.
- Ensure the repository's language runtimes, package managers, and test dependencies are available if you plan to run its tests.
- Record the Claude Code version and operating system used for verification.

## 2. Extract and inspect the package

Extract the ZIP. The root folder is `claude-code-software-development-os/`.

Before merging it into an existing repository, inspect:

- `CLAUDE.md`
- `.claude/settings.json`
- `.claude/agents/`
- `.claude/commands/`
- `.claude/skills/`
- `agents-manifest.json`
- `workflows/`

If the destination already contains `CLAUDE.md`, `.claude/`, settings, commands, agents, skills, hooks, or permission rules, compare and merge them deliberately. **Do not blindly overwrite existing project instructions or settings.** Preserve project-specific configuration and resolve conflicts manually.

## 3. Install into a test repository

### macOS / Linux

From the extracted package directory, copy the contents into the root of a disposable test repository. Example:

```bash
cp -R .claude CLAUDE.md agents-manifest.json commands.txt workflows templates docs scripts CHANGELOG-AGENT-EXPANSION.md /path/to/test-repo/
```

If any destination paths already exist, stop and merge their contents instead of replacing them wholesale. The example assumes those paths do not already exist.

### Windows PowerShell

Review destination conflicts first, then copy the package folders and files into the test repository using Explorer or PowerShell. Example for a new, empty test repository:

```powershell
Copy-Item .claude, CLAUDE.md, agents-manifest.json, commands.txt, workflows, templates, docs, scripts, CHANGELOG-AGENT-EXPANSION.md -Destination C:\path\to\test-repo -Recurse
```

Do not run the copy command against a project with existing configuration until you have reviewed and merged conflicts.

### Windows: safe existing-project installer (recommended)

The package includes `install-to-existing-project.bat`. Keep it in the extracted package root beside `.claude`, `agents-manifest.json`, and `workflows`. Open PowerShell or Command Prompt with the **current directory set to the existing project root**, then run the BAT by its full path. For example:

```powershell
Set-Location "C:\path\to\existing-project"
& "F:\claude-code-software-development-os\install-to-existing-project.bat"
```

The script uses the current directory as the destination and the BAT's own folder as the package source. It copies missing files from `.claude`, `workflows`, `templates`, `docs`, and `scripts`, and copies root-level files only when absent. It does **not overwrite existing files**. Existing root-file conflicts are reported for manual merging; review `CLAUDE.md`, `.claude/settings.json`, agents, and commands carefully. It writes `software-os-install.log` into the project root. This is a file merge helper, not proof of runtime integration.

## 4. Run static package validation

From the installed package root:

```bash
python scripts/validate_os.py
```

On systems where Python 3 is invoked as `python3`:

```bash
python3 scripts/validate_os.py
```

PowerShell:

```powershell
py -3 scripts/validate_os.py
```

Resolve validation errors before continuing. Save the full output as evidence. This script checks package structure and conventions; it does not simulate Claude Code or prove runtime behavior.

## 5. Start Claude Code and inspect what it recognizes

Open a terminal in the test repository root and start Claude Code:

```bash
claude
```

First use a read-only prompt:

> Inspect the installed Software Development OS. Report which project instructions, commands, skills, agents, and settings you can actually discover in this session. Check for missing paths, duplicate names, unsupported frontmatter or settings, and conflicts with existing project instructions. Do not modify application code, configuration, data, or Git state. Distinguish directly observed facts from assumptions.

Compare the response with the files on disk. If Claude Code does not recognize an item, do not assume it is active just because the file exists. Check the syntax and discovery conventions supported by your installed Claude Code version.

## 6. Verify slash commands and skill discovery

Try these commands individually in the Claude Code session, using the syntax supported by your installed version:

1. `/validate-os`
2. `/architecture-map`
3. `/engineering-orchestrator` with a read-only discovery objective
4. `/update-todo` for a test module, if this command is present in the installed package

If a command is not recognized, record it as **not discovered** and investigate its filename, frontmatter, location, and the version's command conventions. Do not report it as passed.

Ask Claude Code to identify relevant skills for a small task. Verify that it can read the intended skill instructions and that the selected specialist agent files are available. A file's presence is not proof of automatic skill invocation.

## 7. Run the first end-to-end smoke test

Use a disposable sample application or a throwaway branch. Request a small, reversible change, such as adding input validation to a tiny function with a unit test.

Use this prompt:

> In this disposable test repository, run the Software Development OS workflow for a small feature. Start in planning mode. Inspect the repository, define acceptance criteria, identify the relevant specialist agents and their available tools, and propose a minimal plan. Do not edit files until I explicitly approve the plan. After approval, implement only the approved change, run the relevant tests, request independent review, update the module-wise TODO.md and task ledger, and produce a completion report. Record the actual command outputs and test results. If a step cannot run, mark it blocked or not run; do not claim success.

Approve only after reviewing the proposed plan. Confirm the run demonstrates:

- The orchestrator selects a relevant agent rather than every agent.
- Agent execution mode matches its declared permissions and available tools.
- No implementation begins before approval.
- Changes stay within the approved scope.
- Tests are actually executed and their results recorded.
- Independent review identifies findings or explicitly reports none with scope limitations.
- The correct module `TODO.md` is created or updated without losing prior content, IDs, or history.
- The completion report separates implemented, verified, and deployed states.

## 8. Test failure and safety handling

In a disposable repository, test at least one safe failure case, such as a deliberately failing unit test or an unavailable optional tool. Confirm the OS reports the failure accurately and does not mark the task resolved.

Do not test destructive actions against real databases, production services, or valuable data. For database or deployment workflows, use disposable resources and require explicit approval before destructive steps. Never expose secrets in prompts, logs, reports, or committed files.

Verify that the system pauses for explicit approval before:

- Destructive data or schema operations.
- Production deployment or changes to live infrastructure.
- Commit, push, release, or other external side effects when approval is required by project policy.
- Scope expansion that materially changes the agreed plan.

## 9. Runtime verification checklist

Record each item as `PASS`, `FAIL`, `BLOCKED`, or `NOT RUN`, with evidence.

| Check | Evidence to save |
|---|---|
| Claude Code version and environment recorded | Version output and OS |
| Instructions and configuration discovered | Session output and file paths |
| Agent manifest matches agent files | Validator output |
| Commands discovered and invocable | Command-by-command results |
| Skills discovered or loaded as expected | Session evidence |
| Approval pause works | Plan and approval interaction |
| Read-only agent cannot be mistaken for an implementer | Agent definition and observed behavior |
| Implementation agent has the required tools | Agent definition and observed behavior |
| Tests run and failures are reported honestly | Actual test output |
| TODO create/update preserves history | Before/after diff |
| Task ledger and report reconcile | Saved ledger and report |
| Failure case remains unresolved | Failure output and resulting task status |
| No unauthorized external or destructive action occurred | Git status and relevant logs |

A check is `PASS` only when its expected behavior was observed. File presence, a generated report, or an agent assertion alone is insufficient evidence for execution-sensitive checks.

## 10. Record results and promote safely

Create a verification report in the test repository, for example `docs/SOFTWARE-DEVELOPMENT-OS-RUNTIME-VERIFICATION.md`, containing:

- Package version/hash, Claude Code version, OS, and date.
- Repository type and test scenario.
- Exact commands and prompts used, excluding secrets.
- PASS/FAIL/BLOCKED/NOT RUN for every check.
- Relevant output snippets, diffs, and test results.
- Known incompatibilities, manual steps, and follow-up TODO IDs.

Only after the smoke tests pass should you merge the configuration into a real project. Review all changes in Git before committing. Roll out to production projects gradually and retain a way to revert the configuration changes.

## Troubleshooting

- **Command not recognized:** Check `.claude/commands/`, command naming/frontmatter, and installed-version conventions.
- **Agent not selected:** Check `agents-manifest.json`, orchestrator routing instructions, agent names, and whether the installed Claude Code supports the configured agent mechanism.
- **Agent cannot edit files:** Check its declared tools and permissions. A read-only specialist should return findings, not be described as having implemented changes.
- **Skill not used:** Check the skill file path and metadata expected by the installed version; explicitly ask Claude Code to inspect the skill rather than assuming automatic activation.
- **Validation passes but runtime fails:** Treat runtime evidence as authoritative for integration. Fix the specific compatibility issue and add a regression check where practical.
- **Existing project instructions conflict:** Preserve local requirements and merge deliberately; do not overwrite them just to match this package.

## Completion criterion

Integration is complete only when the package passes static validation **and** the required runtime smoke tests have evidence. Until then, describe it as installed or structurally validated—not fully runtime-verified or production-proven.
