class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.10.2"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.2/gpilot-cli-0.10.2-aarch64-apple-darwin.tar.gz"
      sha256 "73c1dbac9f7607fb086347ff17d322d02964699d20e930cd298ec6feafb06339"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.2/gpilot-cli-0.10.2-x86_64-apple-darwin.tar.gz"
      sha256 "d50c23933dfc56fc45480647ba88171e5577cefe6932c0c0eb02a0b4ab691722"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.2/gpilot-cli-0.10.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a794f5cd7c9bbee62390383a725f84b4e4af05f19e60d1341b9e2d0eb108c8dc"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.2/gpilot-cli-0.10.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d2fda4381821c0245b1635485fbc51db70b7ffc949a36fddd1e8b4183ec00232"
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
