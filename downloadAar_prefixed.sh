#!/bin/bash

set -e
set -x

# Get VERSION_NAME from gradle.properties
VERSION=`grep -o 'VERSION_NAME=.*' gradle.properties | cut -f2- -d=`

SDK_BIN_URL=https://github.com/webrtc-sdk/android/releases/download/v${VERSION}/libwebrtc_prefixed.aar

echo "Downloading webrtc-sdk ${VERSION} prefixed binary for android."
curl -f -L -O ${SDK_BIN_URL}

# The prefixed aar can't be used as is.
# The .so libs are already prefixed, but the jar itself
# needs to be shadowed to properly add on the prefix.
unzip -o libwebrtc_prefixed.aar -d prefix/
rm -rf android-prefixed/shadow/libs/*
mkdir -p android-prefixed/shadow/libs
mv prefix/classes.jar android-prefixed/shadow/libs/
rm -rf android-prefixed/src/main/jniLibs/*
mkdir -p android-prefixed/src/main/jniLibs
mv prefix/jni/* android-prefixed/src/main/jniLibs

# clean up unzipped prefix files
rm -rf prefix/