#!/bin/bash
# Builds build/CoReader.app (Release) from project.yml.
set -euo pipefail
cd "$(dirname "$0")/.."
xcodegen generate
xcodebuild -project CoReader.xcodeproj -scheme CoReader -configuration Release -derivedDataPath build/DerivedData -destination "platform=macOS,arch=arm64" -quiet build
rm -rf build/CoReader.app
cp -R build/DerivedData/Build/Products/Release/CoReader.app build/CoReader.app
echo "built build/CoReader.app"
