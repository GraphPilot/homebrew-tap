class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.6.0-rc.4"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.6.0-rc.4/gpilot-cli-0.6.0-rc.4-aarch64-apple-darwin.tar.gz"
      sha256 "f003d86636731dd82c3282f48b81dd78c05a7178585899244b6cf6422303953c"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.6.0-rc.4/gpilot-cli-0.6.0-rc.4-x86_64-apple-darwin.tar.gz"
      sha256 "1c34ea8e0fa974151315b77e79658b3238319c02e5b7a25d6fe99f213746225e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.6.0-rc.4/gpilot-cli-0.6.0-rc.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "10ffa67c7e1ff2bc472ba7132273caa7c13e55a217c256ade678d865c3915871"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.6.0-rc.4/gpilot-cli-0.6.0-rc.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3221e3c658d260c9323bbc8091c618e1de27cc168739f389cccf4d81f5d75369"
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
