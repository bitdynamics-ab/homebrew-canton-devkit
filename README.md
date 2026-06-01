# canton-devkit-builds

The public distribution repository for canton-devkit release builds.

This repository hosts the public release artifacts and Homebrew formula 
needed to install released builds before we convert canton-devkit source 
repository to public.

## Homebrew

After a public release is published and the formula is updated with real
checksums, install the latest released formula directly:

```sh
brew install --formula \
  https://raw.githubusercontent.com/bitdynamics-ab/canton-devkit-builds/main/Formula/canton-devkit.rb
```

The formula downloads platform-specific release tarballs from this repository's
GitHub Releases page.

The initial formula uses placeholder `version` and `sha256` values until the
first public release assets are available.

Supported Homebrew platforms:

- macOS Apple Silicon (`darwin/arm64`)
- Linux x86_64 (`linux/amd64`)

## Release Assets

Each release should publish these assets:

```text
canton-devkit_vX.Y.Z_darwin_arm64.tar.gz
canton-devkit_vX.Y.Z_linux_amd64.tar.gz
SHA256SUMS
```

Each tarball must contain:

```text
canton-devkit
LICENSE
README.md
```

The Homebrew formula's `version` and `sha256` fields are updated after release
assets are published.
