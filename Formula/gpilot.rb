class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.2.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.2.0/gpilot-cli-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "a37f8a2910ec262f733593800aaf0db7cabbef6127a05ed8e723a946ca816a30"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.2.0/gpilot-cli-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "3114d357fe47d748cc28438fbaa461912e898e64dd4e87bdaa46be185b2e2707"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.2.0/gpilot-cli-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "116663e003df61d5a2cef2a627a284c009b8c9bff51145d32b6811ffb2b6e51d"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.2.0/gpilot-cli-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "663ddd0aea7aafb9c7535648bb80f1f311e55c5109f605c78d3567a376236e86"
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
