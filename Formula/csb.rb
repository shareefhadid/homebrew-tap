class Csb < Formula
  desc "Sandboxed Claude Code on Apple container"
  homepage "https://github.com/shareefhadid/csb"
  version "0.1.0"
  license "MIT"

  # Apple 'container' is Apple Silicon + macOS 26 only, so is this.
  url "https://github.com/shareefhadid/csb/releases/download/v0.1.0/csb-aarch64-apple-darwin.tar.gz"
  sha256 "f288d122f91615b6758baf72dbac0b2f78822d82bfc9c5c9637a6b18964ae080"

  def install
    bin.install "csb"
  end

  def caveats
    <<~EOS
      csb requires Apple 'container' (macOS 26 Tahoe or newer):
        brew install container

      The first run builds the sandbox image automatically.
      Override the memory cap: export CSB_MEMORY=8g
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/csb --version")
  end
end
