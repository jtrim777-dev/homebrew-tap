class Lsusb < Formula
  include Language::Python::Virtualenv

  desc "A macOS utility for viewing attached USB devices"
  homepage "https://github.com/jtrim777-dev/lsusb"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/lsusb/0.1.6/lsusb-pkg.tgz"
  version "0.1.6"
  sha256 "3938377663954b3aac283f0b2d5f7617011ee3db8c59a6f5731abd24702ab1bd"
  license "MIT"

  depends_on "python"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
  end
end
