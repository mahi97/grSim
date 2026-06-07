---
name: grsim-network-diagnostics
description: Use when diagnosing UDP/network communication issues between grSim, SSL-Vision style consumers, and command/refbox publishers.
---

# grsim-network-diagnostics

## When to use
- Simulator not receiving commands
- Consumers not receiving vision-style packets
- Team color/port mismatch investigations

## Workflow
1. Confirm expected sender and receiver endpoints.
2. Validate protobuf message assumptions in producer/consumer.
3. Inspect runtime logs and packet counters.
4. Reproduce with minimal sender/client setup.

## Quick checks
- Team color flag alignment (`isteamyellow`).
- Robot IDs in command list are valid.
- Packet cadence is non-zero and consistent.

## References
- `references/network-checklist.md`
