class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.3.2"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.3.2/gpilot-cli-0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "81b16366fbae78f7bad3907941b2c1a5c74d0dcb6b45b5c8a44905c826b748e3"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.3.2/gpilot-cli-0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "674342b631c023f4e092d7b1da9e72c8b55863c9ef0261902e73b68d447c4178"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.3.2/gpilot-cli-0.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "21dc274c44de600f056fce4b534992fab1a242471d68fa47e0a2c659459610c6"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.3.2/gpilot-cli-0.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "58ae6abe4ef9decd6484efa5a20226ad061882a73f72efb298b8b19de0dcec51"
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
