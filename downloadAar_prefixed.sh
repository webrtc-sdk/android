#!/bin/bash

set -e
set -x

# Get VERSION_NAME from gradle.properties
VERSION=`grep -o 'VERSION_NAME=.*' gradle.properties | cut -f2- -d=`

SDK_BIN_URL=https://github.com/webrtc-sdk/android/releases/download/v${VERSION}/libwebrtc_prefixed.aar

echo "Downloading webrtc-sdk ${VERSION} prefixed binary for android."
curl -f -L -O ${SDK_BIN_URL}

# The prefixed aar can't be used as is.
# The jar itself needs to be shadowed to properly add on the prefix.
unzip -o libwebrtc_prefixed.aar -d prefix/
rm -rf android-prefixed/shadow/libs/*
mkdir -p android-prefixed/shadow/libs
mv prefix/classes.jar android-prefixed/shadow/libs/

# Copy the .so files to the main project for inclusion.
rm -rf android-prefixed/src/main/jniLibs/*
mkdir -p android-prefixed/src/main/jniLibs
mv prefix/jni/* android-prefixed/src/main/jniLibs

# Rename the so files to liblkjingle_peerconnection_so.so
find android-prefixed/src/main/jniLibs/ -type f \
  -name "libjingle_peerconnection_so.so" \
  -exec sh -c 'f="{}"; mv -- "$f" "${f%libjingle_peerconnection_so.so}liblkjingle_peerconnection_so.so"' \;

# clean up unzipped prefix files
rm -rf prefix/