class LsusbTree < Formula
  include Language::Python::Virtualenv

  desc "A macOS utility for viewing attached USB devices"
  homepage "https://github.com/jtrim777-dev/lsusb"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/lsusb/0.1.3/lsusb-pkg.tgz"
  version "0.1.3"
  sha256 "40d6e3f1aacb4479f7a29bd5cae2081230ead2bc12afd574ed2148014d51c456"
  license "MIT"

  depends_on "python"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
  end
end
