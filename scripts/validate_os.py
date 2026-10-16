#!/usr/bin/env python3
"""Static validation for the Claude Code Software Development OS package.
This validates structure and conventions, not live Claude Code runtime behavior.
"""
from pathlib import Path
import json, sys, zipfile
ROOT = Path(__file__).resolve().parents[1]
errors=[]; checks=0
def check(condition, message):
 global checks
 checks += 1
 if not condition: errors.append(message)

try:
 manifest=json.loads((ROOT/'agents-manifest.json').read_text(encoding='utf-8'))
 check(True,'manifest JSON parses')
except Exception as exc:
 print(f'FAIL: manifest JSON parse: {exc}'); sys.exit(1)

agent_dir=ROOT/'.claude/agents'; actual_agents=sorted(p.relative_to(ROOT).as_posix() for p in agent_dir.glob('*.md'))
entries=manifest.get('agents',[]); names=[a.get('name') for a in entries]; paths=[a.get('file') for a in entries]
check(len(names)==len(set(names)),'agent names unique')
check(len(paths)==len(set(paths)),'agent paths unique')
check(set(paths)==set(actual_agents),f'manifest agent paths match disk ({len(paths)} registered/{len(actual_agents)} files)')
check(manifest.get('agent_count')==len(actual_agents),'agent_count matches disk')
for a in entries:
 check(bool(a.get('name')) and (ROOT/a.get('file','')).is_file(),f"agent file exists: {a.get('file')}")
 body=(ROOT/a['file']).read_text(encoding='utf-8')
 check(body.startswith('---') and f"name: {a['name']}" in body, f"agent frontmatter/name matches: {a['name']}")

command_dir=ROOT/'.claude/commands'; actual_commands={p.stem for p in command_dir.glob('*.md')}
for p in command_dir.glob('*.md'): check(bool(p.read_text(encoding='utf-8').strip()),f'command non-empty: {p.name}')
for c in manifest.get('commands',[]): check(c in actual_commands,f'manifest command exists: {c}')
for p in (ROOT/'.claude/skills').glob('*/SKILL.md'):
 body=p.read_text(encoding='utf-8'); check(body.startswith('---'),f'skill frontmatter: {p.relative_to(ROOT)}')
for skill in manifest.get('skills',[]): check((ROOT/'.claude/skills'/skill/'SKILL.md').is_file(),f'manifest skill exists: {skill}')
for cap,details in manifest.get('phase_capabilities',{}).items():
 for rel in [details.get('workflow'),*details.get('artifacts',[])]:
  if rel: check((ROOT/rel).is_file(),f'{cap} reference exists: {rel}')

required=['workflows/agent-execution-contract.md','workflows/requirements-traceability.md','workflows/todo-task-lifecycle.md','workflows/recovery-validation.md','workflows/ci-quality-gates.md','workflows/event-driven-architecture.md','workflows/infrastructure-as-code.md','workflows/test-environment-isolation.md','templates/AGENT-TASK-LEDGER.md','templates/AUDIT-BASELINE.md','templates/PROJECT-MAP.md','templates/AGENT-RESULT.md','.claude/skills/engineering-state-management/SKILL.md']
for rel in required: check((ROOT/rel).is_file(),f'required artifact exists: {rel}')
for name in ['ci-quality-gate-agent','requirements-traceability-agent','backup-restore-validation-agent','event-messaging-agent','infrastructure-as-code-agent','test-environment-agent']:
 check((agent_dir/f'{name}.md').is_file(),f'new specialist exists: {name}')
orch=(agent_dir/'engineering-orchestrator-agent.md').read_text(encoding='utf-8')
for phrase in ['REVIEW_ONLY','requirements-traceability-agent','ci-quality-gate-agent','TODO files','verification evidence','approval']:
 check(phrase.lower() in orch.lower(),f'orchestrator contract includes {phrase}')
settings=ROOT/'.claude/settings.json'
try: json.loads(settings.read_text(encoding='utf-8')); check(True,'settings JSON parses')
except Exception as exc: errors.append(f'settings JSON parse: {exc}')
idx=(ROOT/'commands.txt').read_text(encoding='utf-8') if (ROOT/'commands.txt').exists() else ''
for c in ['validate-os','architecture-map','audit-diff','agent-efficiency-review','trace-requirements','validate-recovery','check-ci-gates']:
 check(f'/{c}' in idx,f'commands index includes /{c}')
# Check command docs and skill references named in new workflows/commands are present.
for rel in ['.claude/commands/trace-requirements.md','.claude/commands/validate-recovery.md','.claude/commands/check-ci-gates.md']:
 check((ROOT/rel).is_file(),f'new command exists: {rel}')
print(f'Claude Code Software Development OS validation: {checks} checks')
if errors:
 print(f'FAIL: {len(errors)} issue(s)')
 for e in errors: print(' - '+e)
 sys.exit(1)
print('PASS: package structure and conventions validated; live runtime is not tested by this script.')
