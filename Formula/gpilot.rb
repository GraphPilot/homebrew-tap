class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.9.3"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.3/gpilot-cli-0.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "fd182b092d47c0c390c3ce41ecff75bdc22300d2b07b260cc801bb3602c701ad"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.3/gpilot-cli-0.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "6a9e411df0db4441603b008933ca13c250c61add27c4a3caa45f9096493cb823"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.3/gpilot-cli-0.9.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "20bcbb6f99b16920dbe946be4bb6ed6bcecb7bfb2043240b0dbc9ff6e7005079"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.3/gpilot-cli-0.9.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dfdbebdd1507cd865867e52f66fe46bfa9dfd7bc5d3dc03680382b373e845518"
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
