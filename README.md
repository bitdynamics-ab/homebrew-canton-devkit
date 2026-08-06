# homebrew-canton-devkit

> **GitHub Releases in this repository are deprecated.** Download release
> binaries from
> [bitdynamics-ab/canton-devkit/releases](https://github.com/bitdynamics-ab/canton-devkit/releases).
> See the main project at
> [bitdynamics-ab/canton-devkit](https://github.com/bitdynamics-ab/canton-devkit)
> and the
> [installation guide](https://bitdynamics-ab.github.io/canton-devkit/getting-started/).

This repository is the Homebrew tap for canton-devkit. It also hosts related
packaging metadata (such as APT). Release binaries are no longer published
here — use [canton-devkit](https://github.com/bitdynamics-ab/canton-devkit)
instead.

## Quick Install

```sh
curl -fsSL https://raw.githubusercontent.com/bitdynamics-ab/canton-devkit/main/install.sh | sh
```

Or with `wget`:

```sh
wget -qO- https://raw.githubusercontent.com/bitdynamics-ab/canton-devkit/main/install.sh | sh
```

Options (pass as environment variables):

```sh
# Pin a specific version
curl -fsSL https://raw.githubusercontent.com/bitdynamics-ab/canton-devkit/main/install.sh | VERSION=0.4 sh

# Custom install directory
curl -fsSL https://raw.githubusercontent.com/bitdynamics-ab/canton-devkit/main/install.sh | INSTALL_DIR=/usr/local/bin sh
```

The installer downloads the correct binary for your platform, verifies
the SHA-256 checksum, and installs to `~/.local/bin` by default.

> **Note:** The [install.sh](install.sh) in this repository is legacy and
> should not be used. Use the canton-devkit install script above instead.

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

For full DPM install steps, see the
[getting started guide](https://bitdynamics-ab.github.io/canton-devkit/getting-started/).

## Homebrew

Add the tap and install:

```sh
brew tap bitdynamics-ab/canton-devkit
brew install bitdynamics-ab/canton-devkit/canton-devkit
```

To upgrade to a newer version after the formula is updated:

```sh
brew update
brew upgrade canton-devkit
```

The formula downloads platform-specific release tarballs from
[canton-devkit releases](https://github.com/bitdynamics-ab/canton-devkit/releases).
See also the upstream
[Homebrew documentation](https://github.com/bitdynamics-ab/canton-devkit/blob/main/docs/homebrew.md).

Supported Homebrew platforms:

- macOS Apple Silicon (`darwin/arm64`)
- Linux x86_64 (`linux/amd64`)
