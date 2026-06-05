class CantonDevkit < Formula
  desc "Canton DevKit: LocalNet, DAR, contracts, and observability tooling"
  homepage "https://github.com/bitdynamics-ab/homebrew-canton-devkit"
  license "Apache-2.0"
  version "0.6"

  on_macos do
    on_arm do
      url "https://github.com/bitdynamics-ab/homebrew-canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_darwin_arm64.tar.gz"
      sha256 "79c805786ce52db8fc6a810a2870c6664ec516f9ff6af717b202897fc0a0fec5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitdynamics-ab/homebrew-canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_linux_amd64.tar.gz"
      sha256 "f2b9e4d3f207624e2c89c061babd9ab2b3943545984c9d05b426414f19761c1e"
    end
  end

  def install
    bin.install "canton-devkit"
    prefix.install "LICENSE"
    prefix.install "README.md"
  end

  test do
    assert_match "Canton LocalNet", shell_output("#{bin}/canton-devkit localnet --help")
  end
end
