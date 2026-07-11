class CantonDevkit < Formula
  desc "Canton DevKit: LocalNet, DAR, contracts, and observability tooling"
  homepage "https://github.com/bitdynamics-ab/homebrew-canton-devkit"
  license "Apache-2.0"
  version "0.15.2"

  on_macos do
    on_arm do
      url "https://github.com/bitdynamics-ab/homebrew-canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_darwin_arm64.tar.gz"
      sha256 "17e911f80c23c7e5609ea5c04ed9284adc33d08f049963498e323a9d0200e48f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitdynamics-ab/homebrew-canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_linux_amd64.tar.gz"
      sha256 "b075000cc0b4451a6d2e70eb448cdc818820dfa2ed07e02958413ed6fed9ac3e"
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
