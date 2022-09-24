class LsusbTree < Formula
  include Language::Python::Virtualenv

  desc "A macOS utility for viewing attached USB devices"
  homepage "https://github.com/jtrim777-dev/lsusb"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/lsusb/0.1.1/lsusb-pkg.tgz"
  version "0.1.1"
  sha256 "8d095bdf4a97c7a8dd2ff0031b960cbc89428b4b82f10938f17fc60edcd725a9"
  license "MIT"

  depends_on "python"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
  end
end
