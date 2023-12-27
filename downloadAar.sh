#!/bin/bash

set -e
set -x

# Get VERSION_NAME from gradle.properties
VERSION=`grep -o 'VERSION_NAME=.*' gradle.properties | cut -f2- -d=`

SDK_BIN_URL=https://github.com/webrtc-sdk/android/releases/download/v${VERSION}/libwebrtc.aar

echo "Downloading webrtc-sdk ${VERSION} binary for android."
curl -f -L -o "android/libwebrtc.aar" ${SDK_BIN_URL}
