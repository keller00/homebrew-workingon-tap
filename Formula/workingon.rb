class Workingon < Formula
  desc "CLI to track what you're working on"
  homepage "https://github.com/keller00/workingon"
  url "https://github.com/keller00/workingon/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "abd15f0f1416f2cb4844dbc40a590f853dbcef12342c62e8f6d4d7c0c19b5d0b"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/keller00/homebrew-workingon-tap/releases/download/workingon-1.2.0"
    sha256 cellar: :any,                 arm64_tahoe:  "c02bd4ed5a1c5a90356686ab7453a232849c3823d129f12bfa06df39c6e69c2f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8c2fbf81da92c33990bdfc8d35a3fb39a19c3a93e5b2421934a9577884293274"
  end

  depends_on "rust" => :build
  depends_on "sqlite"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"workingon", "--help"
    system bin/"workingon", "ls"
  end
end
