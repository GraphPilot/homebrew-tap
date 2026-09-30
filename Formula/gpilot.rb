class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.11.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.11.0/gpilot-cli-0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "ec7a691dda16b0298538785e41a8b44be05f7c1f26452d0d33e1caaae5b5bf0d"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.11.0/gpilot-cli-0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "cfe9dbe0b875a0edc92c1f29f73f96f4032457865f11436d969390c40561834a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.11.0/gpilot-cli-0.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d48988842ce4592059989159beecf55c378d87f15241a552b8461bc5adc31113"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.11.0/gpilot-cli-0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "93721d93b33dd9e6b3da70642eafbc49214ca223dc5215a9147870fddce28aaa"
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
