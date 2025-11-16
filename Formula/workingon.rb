class Workingon < Formula
  desc "CLI to track what you're working on"
  homepage "https://github.com/keller00/workingon"
  url "https://github.com/keller00/workingon/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "148b54a930f6b81aab2974650b287490133469e5dac4e064be1441a0f28f736e"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/keller00/homebrew-workingon-tap/releases/download/workingon-1.1.1"
    sha256 cellar: :any,                 arm64_tahoe:  "2edef839a10240c2033ce79303fbfbb42f37b25cfa7250a9c2c6bff50a89816f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0e72bacfdbf154ca03336a56a046acf4172c175f4d48caa4bd520a20be4641d7"
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
