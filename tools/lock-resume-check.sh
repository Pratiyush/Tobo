#!/usr/bin/env bash
# Lock the screen with the app open, unlock, and check the app comes back
# without a crash (test-plan.md: lifecycle, backgrounding). Android only:
# simctl has no lock, and iOS backgrounding is covered by app_e2e_test.dart.
# Owner rule: private sandbox emulators only, never a physical phone, never
# a PIN. Called by verify-device.sh after the integration run.
#   tools/lock-resume-check.sh emulator-5564 [evidence.png]
set -euo pipefail
cd "$(dirname "$0")/.."
device="$1"
evidence="${2:-build/device-checks/lock-resume-android.png}"
case "$device" in
  emulator-*) ;;
  *) echo "lock-resume: refusing $device (sandbox emulators only)"; exit 1 ;;
esac
pkg=com.pratiyush.german_words
a() { adb -s "$device" "$@"; }
wakefulness() { a shell dumpsys power | sed -n 's/.*mWakefulness=\([A-Za-z]*\).*/\1/p' | head -1; }

# A normal build: the APK flutter drive leaves behind is the test harness.
# Sandbox only: skip Play Protect's adb-install scan, which can stall.
a shell settings put global verifier_verify_adb_installs 0
a shell settings put global package_verifier_enable 0
# LOCK_RESUME_APK: an APK built before taking the device lock, so the lock
# is never held through a slow (or offline) Gradle build.
apk="${LOCK_RESUME_APK:-}"
if [ -z "$apk" ]; then
  echo "lock-resume: building the app"
  flutter build apk --debug >/dev/null
  apk=build/app/outputs/flutter-apk/app-debug.apk
fi
echo "lock-resume: install $(a install -r "$apk" | tail -1)"
a logcat -c
activity=$(a shell cmd package resolve-activity --brief "$pkg" | tail -1 | tr -d '\r')
echo "lock-resume: launch $activity"
a shell am start -W -n "$activity" | grep -E "Status|LaunchState|Error" || true
sleep 8

a shell input keyevent KEYCODE_POWER
sleep 5
asleep=$(wakefulness)
a shell input keyevent KEYCODE_WAKEUP
a shell wm dismiss-keyguard
sleep 5
awake=$(wakefulness)

resumed=$(a shell dumpsys activity activities | grep -E "mResumedActivity|topResumedActivity" | grep -c "$pkg" || true)
crashes=$(a logcat -d | grep -cE "FATAL EXCEPTION|E/flutter|ANR in $pkg" || true)
mkdir -p "$(dirname "$evidence")"
a exec-out screencap -p > "$evidence"
echo "lock-resume (android): locked=$asleep woke=$awake resumed=$resumed crashes=$crashes"
[ "$asleep" != Awake ] && [ "$awake" = Awake ] && [ "$resumed" -ge 1 ] && [ "$crashes" -eq 0 ]
