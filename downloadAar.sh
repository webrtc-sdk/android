#!/bin/bash

set -e

# Get VERSION_NAME from gradle.properties
VERSION=`grep -o 'VERSION_NAME=.*' gradle.properties | cut -f2- -d=`

SDK_BIN_URL=https://github.com/webrtc-sdk/android/releases/download/${VERSION}/libwebrtc.aar

echo "Downloading webrtc-sdk ${VERSION} binary for android."
curl -L -O ${SDK_BIN_URL}