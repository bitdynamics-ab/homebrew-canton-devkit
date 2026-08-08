# homebrew-canton-devkit

## Cursor Cloud specific instructions

This repository is a **distribution/packaging repo**, not a buildable app. It ships
the `canton-devkit` binary via three channels; there is no compile step, no
dependency manifest, and no automated test suite.

### What lives here
- `install.sh` — POSIX shell installer (downloads a release tarball, verifies a
  checksum, installs to `~/.local/bin`). This is the primary "application".
- `Formula/canton-devkit.rb` — Homebrew formula (Ruby).
- `apt/` — a **static** APT repository: `.deb` files under `apt/pool/...` and a
  generated index under `apt/dists/stable/main/binary-amd64/Packages` (+ `.gz`)
  plus `apt/dists/stable/Release`.

### Dev tooling (installed by the update script)
- `shellcheck` — lint `install.sh`: `shellcheck install.sh`.
  Note: it reports `SC2016` on line ~135; that single-quoted `$PATH` is an
  intentional literal (printed as advice to the user), not a bug.
- `ruby` — syntax-check the formula: `ruby -c Formula/canton-devkit.rb`.
  (Full `brew install`/`brew test` is not set up; `brew` is not installed.)
- `dpkg` / `dpkg-scanpackages` (from `dpkg-dev`, present in base image) — used to
  regenerate/validate the APT index.

### Validating the APT repo
Regenerate the index and confirm it matches what's committed:
```
cd apt && dpkg-scanpackages --multiversion pool /dev/null > /tmp/Packages.gen
diff /tmp/Packages.gen dists/stable/main/binary-amd64/Packages
```
Then confirm the SHA256 sums in `apt/dists/stable/Release` match the actual
`Packages` / `Packages.gz` files.

### Running the product (hello world)
Install the in-repo `.deb` and run the CLI (works offline, no download needed):
```
sudo dpkg -i apt/pool/main/c/canton-devkit/canton-devkit_<version>_amd64.deb
canton-devkit localnet --help   # prints the Canton LocalNet CLI
```
`canton-devkit localnet up` (actually starting a LocalNet) needs Docker and is
not part of environment validation.

### Known caveat (do NOT assume install.sh works end-to-end as-is)
`install.sh` downloads `checksums.txt`, but every published GitHub release ships
the checksum file as `SHA256SUMS`. So piping `install.sh` against a real release
currently fails at the checksum step. This is a pre-existing code/release-asset
mismatch, not an environment problem — flag it before relying on `install.sh`.
