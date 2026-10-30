class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.4.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.4.1/gpilot-cli-1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "e2cafd9dd7d7582bcc04e998b3e880d981c26426db996fa2d2946708a830e0af"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.4.1/gpilot-cli-1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "817e1bf65409a87e8240bddd394ce247bacfbe2b1e20b520119e7f838f6b2fcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.4.1/gpilot-cli-1.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fa80ca7c20e6827d43f677d965326f2e225f7020eac4817a51f84a409a280d56"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.4.1/gpilot-cli-1.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c97e8b213b1187dfb519e714da55eddbf9365b80c85e632e1a9b23922d12b05b"
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
