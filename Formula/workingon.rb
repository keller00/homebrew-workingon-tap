class Workingon < Formula
  desc "CLI to track what you're working on"
  homepage "https://github.com/keller00/workingon"
  url "https://github.com/keller00/workingon/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "43d5ca94d2937438e4c0d90c5ec954bd4b2b49e05951ff555dbff60978a52c79"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/keller00/homebrew-workingon-tap/releases/download/workingon-1.1.2"
    sha256 cellar: :any,                 arm64_tahoe:  "64065ea602bcb37ac52189e091a899ca7516bc1c9620a97eebeb94b2bbf8c247"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "97f4536253102f3ef74e5fdc49321cd5fcb3bac2de5baec9874006e498cdc35d"
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
