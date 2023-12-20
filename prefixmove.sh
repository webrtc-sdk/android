#!/bin/bash
# Similar script to downloadAar_prefixed.sh, without the download part.
# For use with local testing aars.

set -e
set -x

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