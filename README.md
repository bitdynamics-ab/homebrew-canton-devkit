# homebrew-canton-devkit

The public distribution repository for canton-devkit release builds.

This repository hosts the public release artifacts and Homebrew formula 
needed to install released builds before we convert canton-devkit source 
repository to public.

## Quick Install

```sh
curl -fsSL https://raw.githubusercontent.com/bitdynamics-ab/homebrew-canton-devkit/main/install.sh | sh
```

Or with `wget`:

```sh
wget -qO- https://raw.githubusercontent.com/bitdynamics-ab/homebrew-canton-devkit/main/install.sh | sh
```

Options (pass as environment variables):

```sh
# Pin a specific version
curl -fsSL https://raw.githubusercontent.com/bitdynamics-ab/homebrew-canton-devkit/main/install.sh | VERSION=0.4 sh

# Custom install directory
curl -fsSL https://raw.githubusercontent.com/bitdynamics-ab/homebrew-canton-devkit/main/install.sh | INSTALL_DIR=/usr/local/bin sh
```

The installer downloads the correct binary for your platform, verifies
the SHA-256 checksum, and installs to `~/.local/bin` by default.

Supported platforms:

- macOS Apple Silicon (`darwin/arm64`)
- Linux x86_64 (`linux/amd64`)

## DPM component (OCI)

Canton DevKit is also published as a native DPM component to GitHub
Container Registry. Add it to your project's `daml.yaml` (or
`multi-package.yaml`) `components` list and install:

```yaml
# daml.yaml
components:
  - oci://ghcr.io/bitdynamics-ab/canton-devkit:<version>
```

```sh
dpm install package
dpm localnet --help          # confirms the component loaded
```

The OCI artifact is published automatically as part of the Canton DevKit
release process.

## Homebrew

After a public release is published and the formula is updated with real
checksums, add the tap and install:

```sh
brew tap bitdynamics-ab/canton-devkit
brew install bitdynamics-ab/canton-devkit/canton-devkit
```

To upgrade to a newer version after the formula is updated:

```sh
brew update
brew upgrade canton-devkit
```

The formula downloads platform-specific release tarballs from this repository's
GitHub Releases page.

Supported Homebrew platforms:

- macOS Apple Silicon (`darwin/arm64`)
- Linux x86_64 (`linux/amd64`)

## Release Assets

Each release should publish these assets:

```text
canton-devkit_vX.Y.Z_darwin_arm64.tar.gz
canton-devkit_vX.Y.Z_linux_amd64.tar.gz
canton-devkit_windows_amd64.exe
checksums.txt
```

Each tarball must contain:

```text
canton-devkit
LICENSE
README.md
```

The Homebrew formula's `version` and `sha256` fields are updated after release
assets are published.
