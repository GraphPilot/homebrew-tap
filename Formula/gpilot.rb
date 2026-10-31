class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.5.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.5.0/gpilot-cli-1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "9978e42c472116f5b23c0ade3ab138955aa87828aba6693b0155dc8fafe90038"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.5.0/gpilot-cli-1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "ec91206e3cb24b5feb2531720a37a1ef3f5a62d0bcd24920a77283a76babe560"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.5.0/gpilot-cli-1.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "616264cfa6bb2a7b88680fe2e83ff31416e5d9149bba6807e464281512ac0475"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.5.0/gpilot-cli-1.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d25c885e5a6da17a568a8dfbb871439b331aba0f36c3498d394f53cf1e7c630b"
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
