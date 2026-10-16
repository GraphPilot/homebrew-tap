class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.0.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.1/gpilot-cli-1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "639279dfdf127fdf8cb5afa8f4989ffaf33eb74d26d1a8109945398f397f55cb"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.1/gpilot-cli-1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "3bf88ebe5c318ffa1e53f5d34f1efd538adca06dc9bfaca2e05db53c286ad527"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.1/gpilot-cli-1.0.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e164dbeb73888cd9667b662527349de3e7389120263b88eb372b17b02dfe94f7"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.1/gpilot-cli-1.0.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4bafe419f1581e17b5510a7450d5d40633bff1b8574202c9e09cdaa29875f2b5"
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
