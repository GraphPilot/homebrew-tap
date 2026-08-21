class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.8.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.8.0/gpilot-cli-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "7dc8e1697e0ec6519dad0a673b5b762ce46dc27156a40dfec091aaded6950e8f"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.8.0/gpilot-cli-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "8f848ee65607aa268ad7558d46e12372cab018f8750380f19df37d1fd69b7fbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.8.0/gpilot-cli-0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6b1eb7967f9ae3c5102524129316ece41f00da589a5a168ccf2e44542227ff8b"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.8.0/gpilot-cli-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da6a11cbaecffba28c098dab1a30f2f67865df462077b905a869a5b49079ca33"
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
