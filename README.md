# android

![](https://maven-badges.herokuapp.com/maven-central/io.github.webrtc-sdk/android/badge.svg)

WebRTC pre-compiled library for android.

## How to use

This library is hosted on Maven Central. To include this library in your project:

```gradle
  dependencies {
    implementation 'io.github.webrtc-sdk:android:137.7151.00'
  }
```

We also offer a shadowed version that moves the `org.webrtc` package to `livekit.org.webrtc`,
avoiding any collisions with other WebRTC libraries:

```gradle
  dependencies {
    implementation 'io.github.webrtc-sdk:android-prefixed:137.7151.00'
  }
```