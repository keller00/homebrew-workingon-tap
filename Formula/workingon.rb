class Workingon < Formula
  desc "CLI to track what you're working on"
  homepage "https://github.com/keller00/workingon"
  url "https://github.com/keller00/workingon/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e0fba6a7c4c2d35614ca1df0e366fb18f1ec64aaa7be4c3476665ee87936f3d4"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
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
