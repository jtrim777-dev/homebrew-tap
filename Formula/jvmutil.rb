class Jvmutil < Formula
  include Language::Python::Virtualenv

  desc "A utility for viewing and managing the currently installed and active JVMs on macOS"
  homepage "https://github.com/jtrim777-dev/jvmutil"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/jvmutil/0.1.5/jvmutil-pkg.tgz"
  version "0.1.5"
  sha256 "29c924f115321d38b0485b6d99d584afb0083e466dc3bffc67f3efe1ba38e18f"
  license "MIT"

  depends_on "python"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
    # chmod "ugo=rwx", bin/"jvmutil", verbose: true

    executable = (bin/"jvmutil").to_s
    system executable, "relink"
  end

  def caveats
    <<~EOS
      This package creates a symlink to the active JVM at:
        #{prefix}/opt/javahome

      In order to have your system recognize this path, in your shell
      profile you MUST set JAVA_HOME to "#{prefix}/opt/javahome"
    EOS
  end
end
