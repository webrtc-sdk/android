# Release Instructions

1. In the top-level gradle.properties file, update the `VERSION_NAME` property.
1. Update README.md with new version numbers.
1. Update CHANGES.md with change log.
1. Tag with new version number (ensuring that the tag is prefixed with a `v`).
1. Create a new release on Github (the fetch job can handle this and the following step automatically)
1. Add the `libwebrtc.aar`, `libwebrtc_prefixed.aar`, and `libwebrtc_prefixed_stripped.aar` files to the release.
1. Rerun the associated release github action.