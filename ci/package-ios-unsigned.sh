#!/usr/bin/env bash
set -euo pipefail
products="build/DerivedData/Build/Products/Release-iphoneos"
shopt -s nullglob
apps=("$products"/*.app)
if [ "${#apps[@]}" -ne 1 ]; then
  echo "Expected exactly one iPhone app; found ${#apps[@]}" >&2
  exit 1
fi
app="${apps[0]}"
executable=$(/usr/libexec/PlistBuddy -c 'Print :CFBundleExecutable' "$app/Info.plist")
if ! lipo -archs "$app/$executable" | grep -qw arm64; then
  echo "The app must contain physical iPhone arm64 code." >&2
  exit 1
fi
mkdir -p build/ipa-stage/Payload dist
if [ -e "build/ipa-stage/Payload/$(basename "$app")" ]; then
  echo "IPA staging already contains an app; use a fresh build folder." >&2
  exit 1
fi
ditto "$app" "build/ipa-stage/Payload/$(basename "$app")"
ditto -c -k --keepParent build/ipa-stage/Payload dist/Zulu_Hotel_iPhone_unsigned.ipa
(cd dist && shasum -a 256 Zulu_Hotel_iPhone_unsigned.ipa > Zulu_Hotel_iPhone_unsigned.ipa.sha256)
echo "Unsigned IPA packaged. Each tester must sign it before installing."
