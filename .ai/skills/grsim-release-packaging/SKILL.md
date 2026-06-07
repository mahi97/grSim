---
name: grsim-release-packaging
description: Use when preparing grSim releases, including version updates, platform-specific package generation, and release checklist validation.
---

# grsim-release-packaging

## When to use
- Version bumps
- Packaging and artifact generation
- Release readiness checks

## Workflow
1. Confirm version and changelog updates are consistent.
2. Build in clean environment.
3. Run packaging target(s) by platform.
4. Validate artifacts and metadata.

## Platform notes
- Linux: desktop/icon install and package dependency metadata.
- macOS: bundle fixup path and bundle metadata.
- Windows: DLL/config bundling and installer/archive settings.

## References
- `references/release-checklist.md`
