# Changelog

--------------------------------------------
[114.5735.09] - 2024.04.03

* Upgrade to WebRTC-SDK M114.5735.09
* Fix external audio processor sample rate calculation
* Allow ice gathering on any address ports

[114.5735.08.1] - 2024.02.05

* Upgrade to WebRTC-SDK M114.5735.08.1

[114.5735.08] - 2024.01.03

* Upgrade to WebRTC-SDK M114.5735.08
* Feat: add external audio processor for android.

[114.5735.07] - 2023.12.26

* Upgrade to WebRTC-SDK M114.5735.07
* Add a separate prefixed version of the WebRTC-SDK to avoid name collision

[114.5735.05] - 2023.09.21

* Upgrade to WebRTC-SDK M114.5735.05
* Use independent threads to process frame encryption/decryption
* Correct handle SIF frame
* Fix a fault tolerance judgment failure

[114.5735.04] - 2023.09.20

* Upgrade to WebRTC-SDK M114.5735.04
* fix h264 freeze on E2EE.
* Send frame cryptor events from signaling-thread.

[114.5735.03] - 2023.09.14

* Upgrade to WebRTC-SDK M114.5735.03
* Improve e2ee, add setSharedKey to KeyProvider.
* Expose audio sample buffers for Android.
* Add scalabilityMode support for AV1/VP9.
* add failure tolerance for framecryptor.

Corresponds to https://github.com/webrtc-sdk/webrtc/commit/2ab452f5c9427dc97eb8ec2db2023cefef816e18

[114.5735.02] - 2023.07.13

* Upgrade to WebRTC-SDK M114.5735.02
* fix: skip decryption when key invalid.
* Exposing Adapter types in PeerConnectionFactory.

[114.5735.01] - 2023.06.27

* Upgrade to WebRTC-SDK M114.5735.01

[104.5112.10] - 2023.06.08

* Upgrade to WebRTC-SDK M104.5112.10
* fix frame drops for HW AndroidVideoDecoder,
  please use WrappedVideoDecoderFactory instead of DefaultVideoDecoderFactory.

[104.5112.09] - 2023.04.25

* Upgrade to WebRTC-SDK M104.5112.09
* rename KeyManager to KeyProvider.
  
[104.5112.08] - 2023.03.30

* Upgrade to WebRTC-SDK M104.5112.08
* feat: Add key ratchet for FrameCryptor.

[104.5112.07] - 2023.02.02

* Upgrade to WebRTC-SDK M104.5112.07
* feat: Frame encryption for android.

[104.5112.06] - 2023.01.31

* Upgrade to WebRTC-SDK M104.5112.06
* feat: Expose setCodecPreferences/getCapabilities for android.

[104.5112.05] - 2022.11.23

* Upgrade to WebRTC-SDK M104.5112.05
* Fix simulcast when using hardware encoder on Android

Corresponds to https://github.com/webrtc-sdk/webrtc/commit/baa0294c5e48e89887ad09a0fe6785c3aa9cc705

[104.5112.03] - 2022.10.11

* Upgrade to WebRTC-SDK M104.5112.03
* feat: Add getStats for RtpSender/RtpReceiver.
* Added "stopped" RtpTransceiverDirection value

Corresponds to https://github.com/webrtc-sdk/webrtc/commit/9dab54fd76cb5d0a1a10fe6168cb356f392c502f

[104.5112.01] - 2022.07.12

* Upgrade to WebRTC-SDK M104.5112.01

Corresponds to https://github.com/webrtc-sdk/webrtc/commit/a828846eb98e404bf3b00c1abf3787f93171a39c

--------------------------------------------
[97.4692.04] - 2022.05.18

* Fix broken build.
* Built from https://github.com/webrtc-sdk/webrtc/commit/59fde2a30cf5c409a1b5ef193f6e37392a02e1df

[97.4692.03] - 2022.05.14

* **Do not use, build is broken.**
* Fix crash related to VideoRTPReceiver
* Built from https://github.com/webrtc-sdk/webrtc/commit/da9f0586fcd4442071e3a7a6c36915599ce0f29a

[97.4692.02] - 2022.05.10

* Pre-compiled M97 97.4692.02.
* Added `VideoTrack.shouldReceive()` and `setShouldReceive(boolean)`
* Built from https://github.com/webrtc-sdk/webrtc/commit/415fbe5e175b7f5815d497c7563eb03ee6687fbe

[97.4692.01] - 2022.02.15

* Upgrade to WebRTC-SDK M97.4692.01
* Built from https://github.com/webrtc-sdk/webrtc/commit/8c7139f8e6fa19ddf2c91510c177a19746e1ded3

--------------------------------------------
[93.4577.01] - 2021.12.29

* Upgrade to WebRTC-SDK M93.4577.01

[92.4515.03] - 2021.10.27

* Pre-compiled M92 92.4515.03.
* Added PeerConnectionObserverJni::OnRemoveTrack()

[92.4515.02] - 2021.10.26

* Pre-compiled M92 92.4515.02.
* Built from https://github.com/webrtc-sdk/webrtc/commit/7ca0fa605f208ebbfb50c296249b0a3628aac2bc

--------------------------------------------
[92.4515.01] - 2021.09.08

* Pre-compiled M92 92.4515.01.
