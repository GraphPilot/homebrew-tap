class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.1.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.1.1/gpilot-cli-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "81eeb1ff44554755f32549fc243aa5f14d908c0f0810839d312ed03c18ba2844"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.1.1/gpilot-cli-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "dbe3b3aad299d75ddcdc699b2a84d904d03d00386ec82e3c68c5be5dd9d8e14e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.1.1/gpilot-cli-0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8a4967bb8a347dde4e17c1c209a8f1a29aa599227b8e01a5a8d999e2ca4866b6"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.1.1/gpilot-cli-0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dc295781b0562313e93f88f7a59bf69e2b969a77485970d3a37c5bbd8b850d0c"
    end
  end

  def install
    bin.install "gpilot"
    generate_completions_from_executable(bin/"gpilot", "completion", shells: [:bash, :zsh, :fish], base_name: "gpilot")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpilot --version")
  end
end
