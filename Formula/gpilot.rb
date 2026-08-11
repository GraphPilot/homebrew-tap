class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.4.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.4.1/gpilot-cli-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "7b7ca39fc61e7f341b2d7bb5960b855b1a38e141b669f72dc26268e2ebe401ff"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.4.1/gpilot-cli-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "e2b6a2b353915e317bdcbafa36493fe71f1fbabe14b5a2fa5a910773c725a455"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.4.1/gpilot-cli-0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3e1a501655ce4debd09c9b42106d7736656adff40db67c11d8c30d66fb78db4d"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.4.1/gpilot-cli-0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d4739d89b14935238e392ede79d04bd1ffe21ced59826b3e6d4a66e909ef9db6"
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
