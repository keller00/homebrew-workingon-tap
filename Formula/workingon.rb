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

  bottle do
    root_url "https://github.com/keller00/homebrew-workingon-tap/releases/download/workingon-1.0.0"
    sha256 cellar: :any,                 arm64_tahoe:  "f673d8398a273be903faa033fde89420dd203e64389c7d0279ccc060e4718a23"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2daf1685a6d88985ef11f7e9bdcd89d7bae07eec69cb4ac63d9e16debf4b9739"
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
