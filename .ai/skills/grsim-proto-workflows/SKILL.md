---
name: grsim-proto-workflows
description: Use when editing grSim protobuf schemas, validating wire-compatibility, or troubleshooting command packet serialization/deserialization.
---

# grsim-proto-workflows

## When to use
- Any change under `src/proto/*.proto`
- Packet compatibility investigation between simulator and clients

## Workflow
1. Identify whether field changes are additive or breaking.
2. Keep field numbers stable; avoid reusing removed tags.
3. Re-run CMake configure/build to regenerate protobuf C++ sources.
4. Validate command path assumptions (team color, repeated robot commands, required fields).

## Checklist
- No renumbering of existing tags
- Required fields remain intentionally required
- New optional/repeated fields are backward-compatible

## References
- `references/compat-rules.md`
