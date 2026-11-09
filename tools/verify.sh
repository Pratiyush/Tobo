#!/usr/bin/env bash
# Fast gate (German/docs/e2e-standard.md): format, analyze, then every unit,
# widget and headless whole-app flow test (fakes, no device). Budget: 3 min.
# Run before every commit; CI runs it on every push.
set -euo pipefail
cd "$(dirname "$0")/.."
start=$(date +%s)
# DST edge cases need a zone with transitions (CI runners are UTC).
export TZ=Europe/Berlin
flutter pub get >/dev/null
dart format --output=none --set-exit-if-changed lib test tool integration_test test_driver
flutter analyze --no-pub
# Compact in a terminal, one line per test in CI logs.
reporter=compact
if [ -n "${CI:-}" ]; then reporter=expanded; fi
flutter test --no-pub --reporter "$reporter"
secs=$(( $(date +%s) - start ))
echo "fast gate: green in ${secs} s (budget 180 s)"
if [ "$secs" -gt 180 ]; then
  echo "WARNING: over the 3-minute budget; parallelise or move slow cases to tools/verify-device.sh"
fi
