#!/bin/bash

set -e
set -x

unzip -o libwebrtc_prefixed.aar -d prefix/
rm -rf android-prefixed/shadow/libs/*
mkdir -p android-prefixed/shadow/libs
mv prefix/classes.jar android-prefixed/shadow/libs/
rm -rf android-prefixed/src/main/jniLibs/*
mkdir -p android-prefixed/src/main/jniLibs
mv prefix/jni/* android-prefixed/src/main/jniLibs

# clean up unzipped prefix files
rm -rf prefix/