class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.10.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.0/gpilot-cli-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "da8274b2b99a2d7ceac27ba8b908e75f94f08e59487f28e95114600f9f660f90"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.0/gpilot-cli-0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "fb54d9db8c2a9c630d8f9e7f073aa20fb506227576ab5f78a5047a05793d30c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.0/gpilot-cli-0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb7e3ed671c25d6a2e1b4ffca6ea81087ff75708af55cd150d5ffc4bf579e179"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.10.0/gpilot-cli-0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "28e9d09c2067b361c00033daa858c9ec5ccdad7b16854b8d697e9e1837137217"
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
