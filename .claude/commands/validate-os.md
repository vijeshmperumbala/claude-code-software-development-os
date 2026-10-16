---
description: Validate the Software Development OS package structure, manifest references, workflow contracts, and TODO conventions.
---
Run the validation suite without changing application code.
1. Run `python3 scripts/validate_os.py` from the Software Development OS root (use `python` if that is the available command).
2. Review every reported failure; do not suppress errors to make validation pass.
3. Check that all agent files match manifest entries, every manifest path exists, command/skill/workflow references resolve where checkable, and key approval-first/TODO/evidence rules are present.
4. Report exact output and classify checks as PASS/FAIL/BLOCKED/NOT RUN.
5. If asked to fix findings, propose the scope first and request approval for changes that alter behavior or safety controls.
