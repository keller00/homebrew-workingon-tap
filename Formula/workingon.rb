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
    root_url "https://github.com/keller00/homebrew-workingon-tap/releases/download/workingon-1.1.3"
    sha256 cellar: :any,                 arm64_tahoe:  "e3dab47af1e292261fbb131f7868aafd7e4beb2cf53453881a360d6a739c4b9c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9c1825b418ee76a1cd934b71f3805046b6fbcd120069b6959b9aa1f24877cef2"
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
