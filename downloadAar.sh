#!/bin/bash

set -e
set -x

# Get VERSION_NAME from gradle.properties
VERSION=`grep -o 'VERSION_NAME=.*' gradle.properties | cut -f2- -d=`

SDK_BIN_URL=https://github.com/webrtc-sdk/android/releases/download/v${VERSION}/libwebrtc.aar

echo "Downloading webrtc-sdk ${VERSION} binary for android."
curl -f -L -o "android/libwebrtc.aar" ${SDK_BIN_URL}

# WebRTC M150+ compiles the java sources with a JDK 21 target (class file major
# version 65). Stamp the classes back to Java 17 (major 61, what M144 shipped) so
# consumer projects on older AGP/D8 can still dex the aar.
python3 tools/downgrade_class_version.py android/libwebrtc.aar
