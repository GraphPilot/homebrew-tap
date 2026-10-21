class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.1.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.1.0/gpilot-cli-1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "66f1c6c3bbb94b6d4d06be9ae4637a4f2c17eb3bccc511c5f349293ebf777a14"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.1.0/gpilot-cli-1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "494d537f3ee126fbbd4669cc2dd01c28c70c0bc9b181107d26a2e0f9ec8e9806"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.1.0/gpilot-cli-1.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a79629070eb3f5f454586ca7dcc8bdd1f59ffeffe1081b023bdb205b69afe552"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.1.0/gpilot-cli-1.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a98f8c29e78fbc222c86f36437132405ec249335a7c99df127b1e6d13970ca61"
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
