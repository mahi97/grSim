#!/usr/bin/env bash
set -euo pipefail

if [[ -x ./bin/grSim ]]; then
  echo "PASS: found executable ./bin/grSim"
elif [[ -x ./build/grSim ]]; then
  echo "PASS: found executable ./build/grSim"
else
  echo "WARN: grSim binary not found in ./bin or ./build"
fi

if [[ -f ./config/Parsian.ini ]]; then
  echo "PASS: config/Parsian.ini exists"
else
  echo "FAIL: config/Parsian.ini missing"
  exit 1
fi
