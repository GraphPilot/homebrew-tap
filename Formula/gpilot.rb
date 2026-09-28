class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.10.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.1/gpilot-cli-0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "e8398e2ec32e8360baf88080c53378299510932177d66ed05e877c374db6e18c"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.1/gpilot-cli-0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "0358b995e304a3bfc6f049368fde71e22186c9e6e5575dec6437b32b4f91e52b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.1/gpilot-cli-0.10.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a063dcf8e4f4e3f2b430196cf43c5c1fcd6ba0ae2c649e795cd471e5ea710e84"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.1/gpilot-cli-0.10.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "230ec4b6082cabe4e22eae7241fd1190a9f5657069642e9a6b827b48a1134797"
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
