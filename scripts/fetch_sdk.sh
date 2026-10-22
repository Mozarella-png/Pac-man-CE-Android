#!/usr/bin/env bash
# Clones the ReXGlue SDK at the pinned commit and applies this repo's patches.
# Usage: scripts/fetch_sdk.sh [destination-dir]
set -euo pipefail

SDK_URL="https://github.com/rexglue/rexglue-sdk.git"
SDK_COMMIT="bd833a2ab69d305f99ddf57418fc38ffec8af93d"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${1:-$ROOT/rexglue-sdk-src}"

if [ ! -d "$DEST/.git" ]; then
    git clone --filter=blob:none "$SDK_URL" "$DEST"
fi
git -C "$DEST" checkout -q "$SDK_COMMIT"
git -C "$DEST" checkout -q -B pacman-android
git -C "$DEST" -c user.name=ci -c user.email=ci@localhost am -q "$ROOT"/patches/rexglue-sdk/*.patch
echo "SDK ready at $DEST (commit $SDK_COMMIT + patches)"
