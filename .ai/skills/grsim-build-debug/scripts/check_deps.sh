#!/usr/bin/env bash
set -euo pipefail

missing=0
for cmd in cmake protoc; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "MISSING: $cmd"
    missing=1
  else
    echo "FOUND:   $cmd -> $(command -v "$cmd")"
  fi
done

if pkg-config --exists Qt5Core Qt5Widgets Qt5Network; then
  echo "FOUND:   Qt5 pkg-config entries"
else
  echo "WARN:    Qt5 pkg-config entries not found"
fi

if pkg-config --exists ode; then
  echo "FOUND:   ODE pkg-config entry"
else
  echo "WARN:    ODE pkg-config entry not found"
fi

exit "$missing"
