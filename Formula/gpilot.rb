class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.0.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.0/gpilot-cli-1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "0c0b78438ebb2120720a098059ed9ae13bc22f35c9ee8617a70a9ef9e92624c6"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.0/gpilot-cli-1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "e6e13f3110489d2bc94c4380cf40a86057ad282336d104dc35ef7b1f89308e17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.0/gpilot-cli-1.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a10b83a2ff67f815d29a07bde94f6b006bdee4f1d06c4f93a3391c99e53d113e"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.0.0/gpilot-cli-1.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "596caee0a6641a683eaa4b274077f0dd048e08b0e89d942b1ff1c650a32d2fb6"
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
