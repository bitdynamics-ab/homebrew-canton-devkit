class CantonDevkit < Formula
  desc "Canton DevKit: LocalNet, DAR, contracts, and observability tooling"
  homepage "https://github.com/bitdynamics-ab/homebrew-canton-devkit"
  license "Apache-2.0"
  version "0.12.2"

  on_macos do
    on_arm do
      url "https://github.com/bitdynamics-ab/homebrew-canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_darwin_arm64.tar.gz"
      sha256 "ea23dfa7cae4e41d53d5908245204c067d54849b09e8cf8591ffae9a2f3cd11c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitdynamics-ab/homebrew-canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_linux_amd64.tar.gz"
      sha256 "087f7d2c6fc0a80472e6d63b1361352cff15c2b70b445b6beaf66e3a67f4218a"
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
