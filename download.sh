#!/usr/bin/env bash

set -e

VERSION="$1"
OS=$(echo "$2" | cut -d- -f1)

case "$OS" in
    linux | ubuntu)
        ASSET=linux-gcc-14
        ;;
    windows)
        ASSET=windows-msvc-22
        ;;
    macos)
        ASSET=macos-clang-16
        ;;
    *)
        echo "Unknown operating system: '$OS'"
        exit 1
        ;;
esac

URL="https://api.github.com/repos/ArkScript-lang/Ark/releases/latest"
if [[ "$VERSION" != "latest" ]]; then
  URL="https://api.github.com/repos/ArkScript-lang/Ark/releases/tags/$VERSION"
fi

API_OUTPUT=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "$URL")
if [[ $(echo -ne "$API_OUTPUT" | grep "status.*404") != "" ]]; then
  echo "Release '$VERSION' not found"
  exit 1
fi

ASSET_PATH=$(echo -ne "$API_OUTPUT" | grep "browser_download_url.*${ASSET}.zip" | cut -d : -f 2,3 | tr -d \" | tr -d " ")
curl -H "Authorization: token $GITHUB_TOKEN" "$ASSET_PATH" -O -J -L

mkdir -p .arkscript
unzip -oq "${ASSET}.zip" -d .arkscript
rm "${ASSET}.zip"
chmod +x ./.arkscript/arkscript* ./.arkscript/*ArkReactor*

