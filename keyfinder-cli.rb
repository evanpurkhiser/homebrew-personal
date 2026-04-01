class KeyfinderCli < Formula
  desc     "A CLI wrapper for libkeyfinder. Making DJs lives easier."
  homepage "https://github.com/evanpurkhiser/keyfinder-cli"
  url      "https://github.com/evanpurkhiser/keyfinder-cli/archive/v1.2.0.tar.gz"
  version  "v1.2.0"
  license  "GPL-3.0-or-later"
  sha256   "aa69e7fd8991e92898aa660768a448e47995ef25bcca6600474d768cd174d0a9"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any, arm64_sequoia: "8a89dfe05073860c318ceaeae0d1b83270a1c58f69b80d8d13e3b9ec89d8aa75"
  end

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
