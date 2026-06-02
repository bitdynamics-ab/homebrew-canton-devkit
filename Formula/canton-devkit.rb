class CantonDevkit < Formula
  desc "Canton DevKit: LocalNet, DAR, contracts, and observability tooling"
  homepage "https://github.com/bitdynamics-ab/canton-devkit-builds"
  license "Apache-2.0"
  version "0.3"

  on_macos do
    on_arm do
      url "https://github.com/bitdynamics-ab/canton-devkit-builds/releases/download/v#{version}/canton-devkit_v#{version}_darwin_arm64.tar.gz"
      sha256 "3b66046c930d1a733c6d34fd2d0b4f3c5d3d8ac9cf56d351b228c0c2783145bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitdynamics-ab/canton-devkit-builds/releases/download/v#{version}/canton-devkit_v#{version}_linux_amd64.tar.gz"
      sha256 "068f7b859884c33c9a31aa9fbb71a7da4b95bc98f62e80181ded59cb711d24db"
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
