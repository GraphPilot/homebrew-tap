class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.2.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.1/gpilot-cli-1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "7fd6613b812afed43c62fcd1a10a2f2f98212c77a0c375ca85b65cd8a73c081a"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.1/gpilot-cli-1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "f3f443f3b0130c92c73ad1a5a9060c378db515877a5f07751b00d26dcd03b4aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.1/gpilot-cli-1.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c30711614fde66ccd9edf75c1eb77910c706212db32b9e93feb05c203083555c"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.1/gpilot-cli-1.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "df8991bf79b3f8e41c877dc9d837627157d7c0e6d103e358d67649aedfa2526b"
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
