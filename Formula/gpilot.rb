class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.6.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.6.0/gpilot-cli-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "d61e0a7bcabdd327964f0a082d71cea0cd3adb21922ce3b79055d3acafda13c5"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.6.0/gpilot-cli-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "8b664159d59a54708014d24f6e6ce05a994b083722b59e8beb99ca69d09dd650"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.6.0/gpilot-cli-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c094828a482e19cd3cd36788bcaaf7043a26592140e117e41d281d4e773af198"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.6.0/gpilot-cli-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ec46fff38858d1f99b810cf569f52410f7d3f9f1d329d709a4c62245d09fc99b"
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
