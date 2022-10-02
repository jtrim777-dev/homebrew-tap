class LsusbTree < Formula
  include Language::Python::Virtualenv

  desc "A macOS utility for viewing attached USB devices"
  homepage "https://github.com/jtrim777-dev/lsusb"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/lsusb/0.1.2/lsusb-pkg.tgz"
  version "0.1.2"
  sha256 "8aadc52cf4ccc13915cef8559864eaa9dfd3df7b953a6b1c98f60b1866538bc1"
  license "MIT"

  depends_on "python"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
  end
end
