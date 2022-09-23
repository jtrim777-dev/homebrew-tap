class Jvmutil < Formula
  include Language::Python::Virtualenv

  desc "A utility for viewing and managing the currently installed and active JVMs on macOS"
  homepage "https://github.com/jtrim777-dev/jvmutil"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/jvmutil/0.1.2/jvmutil-pkg.tgz"
  version "0.1.2"
  sha256 "ecbdb6d48c268ce7cb560f9d731f7bad7bb952a4b935eafa326d3f9b53d06506"
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
