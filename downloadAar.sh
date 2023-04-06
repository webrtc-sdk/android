#!/bin/bash

set -e

# Get VERSION_NAME from gradle.properties
VERSION=`grep -o 'VERSION_NAME=.*' gradle.properties | cut -f2- -d=`

SDK_BIN_URL=https://github.com/atomirex/webrtc-build/releases/download/m${VERSION}/webrtc.android.tar.gz

echo "Downloading webrtc-sdk ${VERSION} binary for android."
curl -L -O ${SDK_BIN_URL}

tar -xzvf webrtc.android.tar.gz webrtc/aar/libwebrtc.aar
mv webrtc/aar/libwebrtc.aar libwebrtc.aar