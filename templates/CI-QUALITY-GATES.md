# CI Quality Gate Matrix

| Gate | Applicability | Command/workflow | Required? | Result | Evidence | Limitation / follow-up |
|---|---|---|---|---|---|---|
| Format/lint | `<yes/no + reason>` | `<command>` | `<yes/no>` | `NOT RUN` | `<output>` | `<reason>` |
| Types/static analysis | `<...>` | `<...>` | `<...>` | `NOT RUN` | `<...>` | `<...>` |
| Unit tests | `<...>` | `<...>` | `<...>` | `NOT RUN` | `<...>` | `<...>` |
| Integration tests | `<...>` | `<...>` | `<...>` | `NOT RUN` | `<...>` | `<...>` |
| E2E/smoke | `<...>` | `<...>` | `<...>` | `NOT RUN` | `<...>` | `<...>` |
| Security/dependencies/licenses | `<...>` | `<...>` | `<...>` | `NOT RUN` | `<...>` | `<...>` |
| Build/package | `<...>` | `<...>` | `<...>` | `NOT RUN` | `<...>` | `<...>` |
| Migration/recovery checks | `<...>` | `<...>` | `<...>` | `NOT RUN` | `<...>` | `<...>` |

Allowed results: `PASS`, `FAIL`, `BLOCKED`, `NOT RUN`, `NOT APPLICABLE`. Required failed/blocked gates prevent a success claim. Do not invent outputs.
