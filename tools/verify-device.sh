#!/usr/bin/env bash
# Device tier (German/docs/e2e-standard.md): the integration_test flows on one
# private emulator or simulator, with store screenshots. Budget: 15 min.
# Takes the hub heavy lock first; if busy, exits 2 (do fast-gate work, retry).
#   tools/verify-device.sh            # Android (private AVD)
#   tools/verify-device.sh ios        # iPhone 17 Pro Max simulator (6.9-inch shots)
set -euo pipefail
cd "$(dirname "$0")/.."
platform="${1:-android}"
LOCK=../tools/heavy-lock.sh
SANDBOX="$HOME/.claude/skills/device-sandbox/scripts/sandbox.sh"
OWNER=tobo-review
"$LOCK" try "$OWNER" "verify-device $platform" || exit 2
name=tobo-verify
cleanup() {
  "$SANDBOX" "$platform" down "$name" >/dev/null 2>&1 || true
  "$LOCK" release "$OWNER" >/dev/null 2>&1 || true
}
trap cleanup EXIT
start=$(date +%s)
if [ "$platform" = ios ]; then
  device=$("$SANDBOX" ios up "$name" "iPhone 17 Pro Max" | tail -1)
  shots=docs/store-screenshots/ios-6.9
else
  device=$("$SANDBOX" android up "$name" | tail -1)
  adb -s "$device" shell settings put global verifier_verify_adb_installs 0
  adb -s "$device" shell settings put global package_verifier_enable 0
  shots=docs/store-screenshots/android
fi
rm -rf build/screenshots
flutter drive --driver=test_driver/integration_test.dart \
  --target=integration_test/app_e2e_test.dart -d "$device" \
  --dart-define=SCREENSHOTS=true
mkdir -p "$shots" && cp build/screenshots/*.png "$shots/"
if [ "$platform" = android ]; then
  tools/lock-resume-check.sh "$device" docs/better-loop/lock-resume-android.png
fi
echo "device tier ($platform): green in $(( $(date +%s) - start )) s (budget 900 s)"
