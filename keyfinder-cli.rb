class KeyfinderCli < Formula
  desc     "A CLI wrapper for libkeyfinder. Making DJs lives easier."
  homepage "https://github.com/evanpurkhiser/keyfinder-cli"
  url      "https://github.com/evanpurkhiser/keyfinder-cli/archive/v1.1.5.tar.gz"
  version  "v1.1.5"
  license  "GPL-3.0-or-later"
  sha256   "14ec8f453e0873d1504ba517ae0950722ec30c451e694261d6c138810b1d1468"

  depends_on "cmake" => :build
  depends_on "libkeyfinder"
  depends_on "ffmpeg"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
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
