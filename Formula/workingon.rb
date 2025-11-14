class Workingon < Formula
  desc "CLI to track what you're working on"
  homepage "https://github.com/keller00/workingon"
  url "https://github.com/keller00/workingon/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b881de8be79eca53856e6777496a40404f376a094224f9dd3aad92a95981ae15"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/keller00/homebrew-workingon-tap/releases/download/workingon-1.1.0"
    sha256 cellar: :any,                 arm64_tahoe:  "6413862098f7b80380beba49c5b1229d3aea5a9569ed98c2cff2b4da6a3a48ba"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "117554865cd9741614f9e8a2ba133f47709012744d21f74836e4db45f7cf4b5a"
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
