class Jvmutil < Formula
  include Language::Python::Virtualenv

  desc "A utility for viewing and managing the currently installed and active JVMs on macOS"
  homepage "https://github.com/jtrim777-dev/jvmutil"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/jvmutil/0.1.2/jvmutil-pkg.tgz"
  version "0.1.2"
  sha256 "dd450b798e22c46321f075eb889a0fc3c78108d1bf6fe72235e0ff38cd150665"
  license "MIT"

  depends_on "python"

  def install
    # virtualenv_install_with_resources
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
    chmod "ugo=rwx", bin/"jvmutil", verbose: true

    executable = (bin/"jvmutil").to_s
    # gpo = `#{executable} -q active --fields path --display raw`
    system executable, "relink"

    # mkdir libexec
    # ln_s gpo, libexec/"javahome"
    libexec.install_symlink gpo
  end
end
