#!/usr/bin/env bash
# Resizes build/icon/*.png (from render_icon_test.dart) into every platform
# slot. macOS only (sips).
set -euo pipefail
cd "$(dirname "$0")/../.."
SRC=build/icon
RES=android/app/src/main/res
fit() { sips -z "$2" "$2" "$1" --out "$3" >/dev/null; }

# iOS: opaque (App Store rejects alpha), every size in Contents.json.
sips -s format jpeg -s formatOptions best "$SRC/icon_1024.png" --out "$SRC/icon.jpg" >/dev/null
sips -s format png "$SRC/icon.jpg" --out "$SRC/icon_opaque.png" >/dev/null
SET=ios/Runner/Assets.xcassets/AppIcon.appiconset
python3 - "$SET/Contents.json" <<'PY' | while read -r file px; do fit "$SRC/icon_opaque.png" "$px" "$SET/$file"; done
import json, sys
for i in json.load(open(sys.argv[1]))["images"]:
    side = float(i["size"].split("x")[0]) * int(i["scale"][:-1])
    print(i["filename"], round(side))
PY

# Android legacy icons (pre-8.0) and adaptive foreground (108 dp canvas).
for d in mdpi:48:108 hdpi:72:162 xhdpi:96:216 xxhdpi:144:324 xxxhdpi:192:432; do
  IFS=: read -r name legacy fg <<<"$d"
  fit "$SRC/icon_opaque.png" "$legacy" "$RES/mipmap-$name/ic_launcher.png"
  fit "$SRC/foreground_432.png" "$fg" "$RES/mipmap-$name/ic_launcher_foreground.png"
done

# iOS launch screen image (120 pt).
L=ios/Runner/Assets.xcassets/LaunchImage.imageset
fit "$SRC/launch_360.png" 120 "$L/LaunchImage.png"
fit "$SRC/launch_360.png" 240 "$L/LaunchImage@2x.png"
fit "$SRC/launch_360.png" 360 "$L/LaunchImage@3x.png"
echo "icons written"
