class Gpilot < Formula
  desc "GraphPilot CLI"
  homepage "https://github.com/GraphPilot/gpilot"
  version "0.1.0"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.1.0/gpilot-cli-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "6ae061c17aca60db06a0fcb19efb724ca1b70f97b92c446e04d78c616e632faf"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.1.0/gpilot-cli-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "133ce787a552896bf4216afd5ccf6a9a4e6be2c8ae82e387be1017e3c40443af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.1.0/gpilot-cli-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e407c074bed2a4d7dcb040817d039182be6aea7989aa4aadc2b891cbbc32b337"
    end
    on_intel do
      url "https://github.com/GraphPilot/gpilot/releases/download/v0.1.0/gpilot-cli-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d710cd344ecc58717a2649a5fc135fcf68f0309354918603e4555bb8136dd83b"
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
