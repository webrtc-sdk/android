#!/bin/bash
# Similar script to downloadAar_prefixed_stripped.sh, without the download part.
# For use with local testing aars.

set -e
set -x

# The prefixed aar can't be used as is.
# The jar itself needs to be shadowed to properly add on the prefix.
unzip -o libwebrtc_prefixed_stripped.aar -d prefix/
rm -rf android-prefixed-stripped/shadow/libs/*
mkdir -p android-prefixed-stripped/shadow/libs
mv prefix/classes.jar android-prefixed-stripped/shadow/libs/

# Copy the .so files to the main project for inclusion.
rm -rf android-prefixed-stripped/src/main/jniLibs/*
mkdir -p android-prefixed-stripped/src/main/jniLibs
mv prefix/jni/* android-prefixed-stripped/src/main/jniLibs

# Rename the so files to liblkjingle_peerconnection_so.so
find android-prefixed-stripped/src/main/jniLibs/ -type f \
  -name "libjingle_peerconnection_so.so" \
  -exec sh -c 'f="{}"; mv -- "$f" "${f%libjingle_peerconnection_so.so}liblkjingle_peerconnection_so.so"' \;

# clean up unzipped prefix files
rm -rf prefix/
