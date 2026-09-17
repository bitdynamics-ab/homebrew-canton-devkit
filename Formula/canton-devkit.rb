class CantonDevkit < Formula
  desc "Canton DevKit: LocalNet, DAR, contracts, and observability tooling"
  homepage "https://github.com/bitdynamics-ab/canton-devkit"
  license "Apache-2.0"
  version "0.18.0"

  on_macos do
    on_arm do
      url "https://github.com/bitdynamics-ab/canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_darwin_arm64.tar.gz"
      sha256 "eb7a58449bdc1472414e441f6b3ee4d3860740f1f8e5f32480aee3e7098a4ae1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitdynamics-ab/canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_linux_amd64.tar.gz"
      sha256 "4529c469ac254fb70f991a2b0088003f64d10e6e28925df16a2ea71a58236e9a"
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
