class Jvmutil < Formula
  include Language::Python::Virtualenv

  desc "A utility for viewing and managing the currently installed and active JVMs on macOS"
  homepage "https://github.com/jtrim777-dev/jvmutil"
  url "https://maven.jtrim777.dev/releases/dev/jtrim777/jvmutil/0.1.1/jvmutil-pkg.tgz"
  version "0.1.1"
  sha256 "296d677ccac20d7069d62d215ebeb70e10d89c5cc89037297ad029c2b197f0b5"
  license "MIT"

  depends_on "python"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # virtualenv_install_with_resources
    bin.install Dir["bin/*"]
    man1.install Dir["share/man/man1/*"]
    chmod "ugo=rwx", bin/"jvmutil", verbose: true

    output = system bin/"jvmutil", "-q", "active", "--fields", "path", "--display", "raw"
    ln_s libexec/"javahome", output
  end

  # test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test jvmutil`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # system "false"
  # end
end
