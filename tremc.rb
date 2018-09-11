class Tremc < Formula
  desc "Curses interface for transmission"
  homepage "https://github.com/tremc/tremc"
  url "https://github.com/tremc/tremc/archive/0.9.1.tar.gz"
  version "0.9.1"
  sha256 "ec1b37e43209c002bc4f621f6ab6a5124ec71d9fd5c5a8cabfd3e0622132412f"

  def install
    system "make install PREFIX=#{prefix}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test tremc`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
