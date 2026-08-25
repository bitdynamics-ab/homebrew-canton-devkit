class CantonDevkit < Formula
  desc "Canton DevKit: LocalNet, DAR, contracts, and observability tooling"
  homepage "https://github.com/bitdynamics-ab/canton-devkit"
  license "Apache-2.0"
  version "0.17.5"

  on_macos do
    on_arm do
      url "https://github.com/bitdynamics-ab/canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_darwin_arm64.tar.gz"
      sha256 "6885f3c9f52ff0b716a8ae9188167499b06638a29764697267cf833c823fd305"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitdynamics-ab/canton-devkit/releases/download/v#{version}/canton-devkit_v#{version}_linux_amd64.tar.gz"
      sha256 "80be664144dec517afb12e431b3a0140981474b50d8c87cddfb8fd51eb25efdb"
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
