class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.5.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.5.1/gpilot-cli-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "82bcabf6ac4b7364ef6e2a1669f35417561ee370b6fe4c33fae68de3bef6b37f"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.5.1/gpilot-cli-0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "e3285d0d791f4ec33a0a7b59aaf82551d3808c73c8b040be27e3dd8b7da81b83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.5.1/gpilot-cli-0.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "14f14d50ad01e143623a3c79be853fa95c2474c8c025934341599f1082fe88dc"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.5.1/gpilot-cli-0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "26a916a46a95a75a64e65cd19db3abae5a812d02dc8205709b11677e931e20bc"
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
