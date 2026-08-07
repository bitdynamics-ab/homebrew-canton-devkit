class CantonDevkit < Formula
  desc "Canton DevKit: LocalNet, DAR, contracts, and observability tooling"
  homepage "https://github.com/bitdynamics-ab/canton-devkit"
  license "Apache-2.0"
  version "0.16.5"

  on_macos do
    on_arm do
      url "https://github.com/bitdynamics-ab/canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_darwin_arm64.tar.gz"
      sha256 "0574ec7e2e3315181d6417d5881ef4a9205fc37cd031cd0dd50f64540f8b1d4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitdynamics-ab/canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_linux_amd64.tar.gz"
      sha256 "001dcdf98a322f563e7e8deab9be7311b49766508e116d48ef752125ba594eb6"
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
