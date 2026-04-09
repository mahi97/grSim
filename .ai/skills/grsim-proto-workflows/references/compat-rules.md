# Protobuf compatibility rules

- Prefer additive changes (`optional`/`repeated`) to preserve compatibility.
- Never change semantic meaning of existing field numbers.
- Do not recycle deleted field numbers.
- Treat changing `required` fields as breaking.
- Validate downstream usage in both simulator and sample clients.
