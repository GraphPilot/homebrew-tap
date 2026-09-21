class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.9.2"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.2/gpilot-cli-0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "e25d99a86184a763c5d0d68d7edd026bbabbd19937366598b6e5d897a82a802c"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.2/gpilot-cli-0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "88ecb2af3a66d4132d3cf0f3102bd93bcce91214444b3435fac99745dc2466a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.2/gpilot-cli-0.9.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "33e5ec3f837a19877ca58e7282dd1175112163c25c46f6b8715bc858eae76efd"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.9.2/gpilot-cli-0.9.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "39ab74a32047dc364ad03cc1cdecb77ba9d8673aeef8e6019fc6ed6526c8c783"
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
