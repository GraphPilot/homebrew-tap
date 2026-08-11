class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.4.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.4.0/gpilot-cli-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "792dde12e095dd74e34c87ea7f5a1d9e8facec74ed90a292d633e4c47565a0c4"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.4.0/gpilot-cli-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "78b8e8206bee08544aadc8ff0ddcf0e16ee18aa94867d5dc7e664e62f31c2839"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.4.0/gpilot-cli-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6f93f72e1119e096d1ecd99aac83c2378cc8ef30becd66295876321d1d8c08e9"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.4.0/gpilot-cli-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6741a9590b2317bab90ff73819c29983b7f98eb462bfbf50c2d74e15a0d28ecc"
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
