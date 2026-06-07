---
name: grsim-build-debug
description: Use when building grSim, fixing CMake/Qt/OpenGL/ODE/protobuf dependency issues, or validating simulator startup after C++ changes.
---

# grsim-build-debug

## When to use
- Build/setup tasks
- Compiler or linker failures
- Startup sanity checks after core code changes

## Inputs to gather
- Host OS and toolchain
- Full failing command and first error
- Whether `.proto` or `config/*.ini` changed

## Workflow
1. Run `scripts/check_deps.sh` to quickly detect missing tools.
2. Configure a clean build directory.
3. Build with parallel jobs and capture the first error.
4. Apply the minimal fix and rebuild.
5. Run `scripts/sanity_check.sh`.

## Commands
- `bash .ai/skills/grsim-build-debug/scripts/check_deps.sh`
- `cmake -S . -B build`
- `cmake --build build -j`
- `bash .ai/skills/grsim-build-debug/scripts/sanity_check.sh`

## References
- `references/common-failures.md`
