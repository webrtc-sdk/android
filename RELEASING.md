# Release Instructions

1. In the top-level gradle.properties file, update the `VERSION_NAME` property.
1. Update README.md with new version numbers.
1. Update CHANGES.md with change log.
1. Tag with new version number (ensuring that the tag is prefixed with a `v`).
1. Create a new release on Github.
1. Add the `libwebrtc.aar` and `libwebrtc_prefixed.aar` files to the release.
1. Rerun the associated release github action.