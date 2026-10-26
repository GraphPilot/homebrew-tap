class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "1.2.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.0/gpilot-cli-1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "0555d11fdc6a39181e91c06b3c5c46737f5a3e5eb69df67e77d4614cbe11ed49"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.0/gpilot-cli-1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a0f7acbce63a7c5384bd59cb496b07332c23512be9f3eceffd02806bd1d26084"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.0/gpilot-cli-1.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2bddc1f1118ec3eb8c48b7ad2692e138a7970364b5a121f8baaa42037490410e"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v1.2.0/gpilot-cli-1.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3dbe282141f076e24c68cb9937ace21b44f3a53f578394304cad829106f76391"
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
