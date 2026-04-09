# AGENTS.md instructions for /workspace/grSim

This repository defines local skills for agentic workflows.

## Skills
A skill is a reusable, task-focused instruction set stored in a `SKILL.md` file.

### Available skills
- grsim-build-debug: Build, dependency triage, and runtime sanity checks for grSim. (file: `.ai/skills/grsim-build-debug/SKILL.md`)
- grsim-proto-workflows: Safe protobuf/schema changes and compatibility checks for simulator packets/clients. (file: `.ai/skills/grsim-proto-workflows/SKILL.md`)
- grsim-config-tuning: Robot geometry and physics tuning with disciplined validation/rollback steps. (file: `.ai/skills/grsim-config-tuning/SKILL.md`)
- grsim-release-packaging: Version, packaging, and release checklist for Linux/macOS/Windows build flows. (file: `.ai/skills/grsim-release-packaging/SKILL.md`)
- grsim-network-diagnostics: Diagnose command/vision/refbox networking issues and packet flow assumptions. (file: `.ai/skills/grsim-network-diagnostics/SKILL.md`)

## How to use skills
- Trigger rules: Use a skill when the user names it explicitly, or when the task clearly matches its description.
- Progressive disclosure:
  1) Read only the relevant `SKILL.md` first.
  2) Open `references/` files only when needed.
  3) Prefer running `scripts/` when available for repeatable checks.
- Keep context lean. Do not load unrelated skills.
- If multiple skills apply, use the minimum set and state the order.

## Safety and fallback
- If a skill file is missing or stale, state that briefly and continue with best-effort repo-aware guidance.
- Do not fabricate command output; run commands when verification is needed.
