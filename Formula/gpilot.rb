class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.2.2"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.2/gpilot-cli-1.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "8f64355f7667457e3b91b2bd9952d6aafd06b433853b008d14612b1baa57352d"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.2/gpilot-cli-1.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "f031ef8267e9775fc805544eebf33e1fbe3a5a168a7e7daf2d7ae379cc5825dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.2/gpilot-cli-1.2.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "64b4755ed4608bb94e7b1606cc4583a62fd70ea579537f75e4c08e9aa9d252ec"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.2/gpilot-cli-1.2.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d925523bedd609650d17be206a5f06c8bffc531c917b67743d16edf2ab09eace"
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
