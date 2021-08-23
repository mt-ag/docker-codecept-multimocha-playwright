#!/usr/bin/env bash

function file_exists() {
  FILE=$1

  if [ ! -f "$FILE" ]; then
    echo "$FILE not found."
    exit 1
  else
    echo "$FILE found."
  fi
}

rm -rf ./test/chromium/output || true
rm -rf ./test/firefox/output || true
rm -rf ./test/webkit/output || true
rm -rf ./test/video-recording/output || true

docker run --rm -v $(pwd)/test/chromium:/tests codecept-multimocha-playwright:latest

docker run --rm -v $(pwd)/test/firefox:/tests codecept-multimocha-playwright:latest

docker run --rm -v $(pwd)/test/webkit:/tests codecept-multimocha-playwright:latest

docker run --rm -v $(pwd)/test/video-recording:/tests codecept-multimocha-playwright:latest

file_exists ./test/chromium/output/Chromium_Whatsmybrowser.png

file_exists ./test/firefox/output/Firefox_Whatsmybrowser.png

file_exists ./test/webkit/output/Webkit_Whatsmybrowser.png

file_exists ./test/video-recording/output/video/*.webm

echo "Tests completed successfully..."
