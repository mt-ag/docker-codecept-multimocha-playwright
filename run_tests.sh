#!/usr/bin/env bash

function file_exists() {
  FILE=$1

  if [ ! -f "$FILE" ]; then
    echo "$FILE not found."
    exit 1
  fi
}

rm -rf ./test/chromium/output || true
rm -rf ./test/firefox/output || true
rm -rf ./test/webkit/output || true

docker run --rm -v $(pwd)/test/chromium:/tests codecept-multimocha-playwright:latest

docker run --rm -v $(pwd)/test/firefox:/tests codecept-multimocha-playwright:latest

docker run --rm -v $(pwd)/test/webkit:/tests codecept-multimocha-playwright:latest

file_exists ./test/chromium/output/Chromium_Whatsmybrowser.png

file_exists ./test/firefox/output/Firefox_Whatsmybrowser.png

file_exists ./test/webkit/output/Webkit_Whatsmybrowser.png

echo "Tests completed successfully..."
