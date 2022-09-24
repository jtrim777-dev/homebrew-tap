class Jvmutil < Formula
  include Language::Python::Virtualenv

  desc "A utility for viewing and managing the currently installed and active JVMs on macOS"
  homepage "https://github.com/jtrim777-dev/jvmutil"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/jvmutil/0.1.7/jvmutil-pkg.tgz"
  version "0.1.7"
  sha256 "48bbb691dbea2b2631c3b18a6b7a787568f1f5d2530ab72218fd2c58683d3b1e"
  license "MIT"

  depends_on "python"

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
    # chmod "ugo=rwx", bin/"jvmutil", verbose: true

    executable = (bin/"jvmutil").to_s

    system "sed", "-i", "", "s:{{BIN_PATH}}:#{bin.to_s}:", executable
    system "sed", "-i", "", "s:{{ETC_PATH}}:#{pkgetc.to_s}:", executable

    system executable, "relink"
  end

  def caveats
    <<~EOS
      This package creates a symlink to the active JVM at:
        #{pkgetc}/javahome

      In order to have your system recognize this path, in your shell
      profile you MUST set JAVA_HOME to "#{pkgetc}/javahome"
    EOS
  end
end
