class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.7.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.7.0/gpilot-cli-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "939fe1357beb80ec505a1ba437bf6f16a0adaf5bff43ef53cc1e574c0793058c"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.7.0/gpilot-cli-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "a60e9913023e3efd69841bc99cd54859269e1a034b2d44c33f9557721796a616"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.7.0/gpilot-cli-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ca57faeae2fd5d51d463321addefe542c226ec7bd6f76b21aa6ffd6f4475f58e"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.7.0/gpilot-cli-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d604b4a10d7fa78be148508d661d628244c0ebd58e7b2284d65cac48c05a2a63"
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
