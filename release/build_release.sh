#!/usr/bin/env bash
set -e

# build_release.sh
# Usage: run this from the repository root to create a release zip in ./release/dist/

ROOT_DIR=$(pwd)
RELEASE_DIR="$ROOT_DIR/release/dist"
MODS_DIR="$ROOT_DIR/release/mods"

mkdir -p "$RELEASE_DIR"
mkdir -p "$MODS_DIR"

echo "Please place all mod .jar files into: $MODS_DIR"
echo "If you have direct download URLs, you can add them to release/mods_to_download.txt next to the mod name (tab-separated: filename\tURL) and uncomment the wget loop below."

# Example of automatic download (commented because many sites require cookies/API):
# while IFS=$'\t' read -r fname url; do
#   if [ -n "$url" ]; then
#     echo "Downloading $fname from $url"
#     wget -O "$MODS_DIR/$fname" "$url"
#   fi
# done < release/mods_to_download.txt

# Copy configs and other prepared files
cp -r configs "$RELEASE_DIR/"
cp manifest.json "$RELEASE_DIR/manifest.json"
cp MODS_CLEANED.md "$RELEASE_DIR/MODS_CLEANED.md"
cp DEPENDENCIES.md "$RELEASE_DIR/DEPENDENCIES.md"

# Copy mod jars into the release if present
if [ "$(ls -A "$MODS_DIR" 2>/dev/null || true)" ]; then
  mkdir -p "$RELEASE_DIR/mods"
  cp "$MODS_DIR"/* "$RELEASE_DIR/mods/"
fi

# Create zip
cd "$RELEASE_DIR/.."
ZIP_NAME="tactical-nightmare-modpack-release.zip"
zip -r "$ZIP_NAME" "dist"

echo "Release zip created at: $RELEASE_DIR/../$ZIP_NAME"
