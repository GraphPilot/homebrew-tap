class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.11.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.11.1/gpilot-cli-0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "54645948fd31088b71baea8c86a6e22bf5b0e2cc6a186383c780446717c5c03a"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.11.1/gpilot-cli-0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "6b8a8faed99bd107688362573f768b61e325a397036164bd25138693b875700f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.11.1/gpilot-cli-0.11.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1aab82a38aac78f9a52606340deea0f82d5a14115431d3a6219cc2672cad5121"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.11.1/gpilot-cli-0.11.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f91e47c9adcd88760b282b1920d2cf22c06a9cc333a9e9c4f2d8dc7f11773dae"
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
