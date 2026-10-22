class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.1.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.1.1/gpilot-cli-1.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "41ac48b9c6243bee0802f75f0c7a583a59946f5f6f8cf999506d8f626f155815"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.1.1/gpilot-cli-1.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "0af713a064e37fc4b5764d3600a84ee8218397d9baec6e63674ff5538ab6569a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.1.1/gpilot-cli-1.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "480923f9a0c3fbf8b9718a4ad3f34c8602b83c15cf7abdd05bb30e58a2569237"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.1.1/gpilot-cli-1.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d35ac3b5111329169d31666ce2062fb405b7680949a16548fb02a1e14b6a10e4"
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
