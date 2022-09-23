class Jvmutil < Formula
  include Language::Python::Virtualenv

  desc "A utility for viewing and managing the currently installed and active JVMs on macOS"
  homepage "https://github.com/jtrim777-dev/jvmutil"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/jvmutil/0.1.3/jvmutil-pkg.tgz"
  version "0.1.3"
  sha256 "a13f54863950fccf32c9615035cd6e0339df6f8bae54f0f7dd7467ecc8310f9b"
  license "MIT"

  depends_on "python"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
    # chmod "ugo=rwx", bin/"jvmutil", verbose: true

    executable = (bin/"jvmutil").to_s
    system executable, "relink"
  end
end
