class KeyfinderCli < Formula
  desc     "A CLI wrapper for libkeyfinder. Making DJs lives easier."
  homepage "https://github.com/evanpurkhiser/keyfinder-cli"
  url      "https://github.com/evanpurkhiser/keyfinder-cli/archive/v1.1.2.tar.gz"
  version  "v1.1.2"
  license  "GPL-3.0-only"
  sha256   "144539cd7fee223dca3a052435c1b2df0ab8b8c3170753ecc7f9c4d915d2bb07"

  depends_on "libkeyfinder"
  depends_on "ffmpeg"

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
