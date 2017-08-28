class Tremc < Formula
  desc "Curses interface for transmission"
  homepage "https://github.com/louipc/tremc"
  url "https://github.com/EvanPurkhiser/tremc/archive/87b61dbf927300bc85a1abac830dd1713202e322.zip"
  version "87b61dbf927300bc85a1abac830dd1713202e322"
  sha256 ""

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
