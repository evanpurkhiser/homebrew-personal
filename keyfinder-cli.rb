# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class KeyfinderCli < Formula
  desc     "A CLI wrapper for libkeyfinder. Making DJs lives easier."
  homepage "https://github.com/EvanPurkhiser/keyfinder-cli"
  url      "https://github.com/EvanPurkhiser/keyfinder-cli/archive/v1.0.1.tar.gz"
  sha256   "8d43c80e13eda18297567e8acacb4849680c065c8c25fbad10a2a36b4392ab8d"

  depends_on "libkeyfinder"

  def install
    system "make install PREFIX=#{prefix}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test keyfinder-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
