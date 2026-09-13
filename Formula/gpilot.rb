class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.9.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.1/gpilot-cli-0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "d6258c8b3b7c5d4df8a77bc1c517cf0b2e43e80aa3fdc6c77425dbd541a153d1"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.1/gpilot-cli-0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "825014ad173a18990e6a76a07f850437eb47e2bcf3b8575e0cee9e4bc336c9a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.1/gpilot-cli-0.9.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dff5f4d9509637cc177524b63ab1013bfc207c3c169dea8b3432a304deb143e1"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.1/gpilot-cli-0.9.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8aa74a8bf36c7ff886f2ab94ae65e4f480694618173aec3c5ddd03a1eba581ff"
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
