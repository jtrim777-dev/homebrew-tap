class LsusbTree < Formula
  include Language::Python::Virtualenv

  desc "A macOS utility for viewing attached USB devices"
  homepage "https://github.com/jtrim777-dev/lsusb"
  url "https://github.com/jtrim777-dev/lsusb/releases/download/v0.1.4/lsusb-pkg.tgz"
  version "0.1.4"
  sha256 "24a0ce548ee6c80f09fa3ef7bd1d6e2d94079c66516885a45ed0d1db71546251"
  license "MIT"

  depends_on "python"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
  end
end
