class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.9.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.0/gpilot-cli-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "4adfc4777e89a7bd9ba5aaf314875d177e00896e711fe0d0d621f1afca5bfb0d"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.0/gpilot-cli-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "3b2995d98239c317c0c31a96b1a229c5aaba19c3b8ffdfdd894e80ac9a72e6f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.0/gpilot-cli-0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "132d5a7753b7b7245d0718cfca4e7033c17663108231c3a392ceee31ac9079ae"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.0/gpilot-cli-0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b82383897fb2f227dc652a982b6a3432fa5a5d3fc27f3f55979b71406ea93c69"
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
