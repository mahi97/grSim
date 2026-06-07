---
name: grsim-config-tuning
description: Use when tuning robot geometry/physics INI files and validating behavior changes with reproducible parameter update steps.
---

# grsim-config-tuning

## When to use
- Editing `config/*.ini`
- Investigating robot motion realism or control response

## Workflow
1. Snapshot baseline config file.
2. Change one parameter group at a time (geometry, then physics).
3. Record old/new values and expected effect.
4. Keep a rollback copy for quick bisect.

## Parameter domains
- Geometry: dimensions and wheel/kicker placement.
- Physics: mass/friction/torque related values.

## References
- `references/parameter-guide.md`
