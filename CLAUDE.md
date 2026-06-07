# CLAUDE.md

Repository-local AI workflow guide for Claude Code.

## Local skill catalog
Claude Code should treat these as reusable playbooks and load the matching `SKILL.md` for the task:

- `.ai/skills/grsim-build-debug/SKILL.md`
- `.ai/skills/grsim-proto-workflows/SKILL.md`
- `.ai/skills/grsim-config-tuning/SKILL.md`
- `.ai/skills/grsim-release-packaging/SKILL.md`
- `.ai/skills/grsim-network-diagnostics/SKILL.md`

## Invocation guidance
- If user asks to build/fix compile issues: use **grsim-build-debug**.
- If user changes `.proto` files or packet behavior: use **grsim-proto-workflows**.
- If user tunes robot dynamics/INI files: use **grsim-config-tuning**.
- If user asks for release artifacts/version bumping: use **grsim-release-packaging**.
- If user asks about UDP packet flow or command reception: use **grsim-network-diagnostics**.

## Execution pattern
1. Read only the relevant `SKILL.md` files.
2. Pull in `references/*.md` as needed.
3. Run helper scripts from `scripts/` for deterministic checks.
4. Report exact commands and concrete outcomes.

## Notes
- Keep prompts concise and avoid loading all skills at once.
- Prefer repository scripts over ad hoc one-off commands when both are available.
