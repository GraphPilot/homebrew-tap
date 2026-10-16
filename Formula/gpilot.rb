class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.0.2"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.2/gpilot-cli-1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "384d4d6a57ec44a4ead2ab6512fa9504b1bdf05a3419024d46bace60f778dee8"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.2/gpilot-cli-1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "ad4e508e43a29d6728ec71ca4a00acb4cbded1956cac15d97301ef4ff032807b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.2/gpilot-cli-1.0.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "04847dad6d9ace3152f660fecc2775b3d6ffafebd96cc1aa8220a5f4ca2b6c9f"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.2/gpilot-cli-1.0.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6350dce59e640a555542d05b05c13cc44292d66c8737364bfc87bcb5f843c4b2"
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
