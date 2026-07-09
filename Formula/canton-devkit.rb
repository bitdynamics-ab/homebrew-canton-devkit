class CantonDevkit < Formula
  desc "Canton DevKit: LocalNet, DAR, contracts, and observability tooling"
  homepage "https://github.com/bitdynamics-ab/homebrew-canton-devkit"
  license "Apache-2.0"
  version "0.14.0"

  on_macos do
    on_arm do
      url "https://github.com/bitdynamics-ab/homebrew-canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_darwin_arm64.tar.gz"
      sha256 "a2e06b06d07d96203539e947538399eda1469ac44cbe78af12286f6a982c4ae0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitdynamics-ab/homebrew-canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_linux_amd64.tar.gz"
      sha256 "e4cac02a484dd82e16346639c490703d2a1e6e6bcf3fa3fd1a3ac8a53d3b35ed"
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
