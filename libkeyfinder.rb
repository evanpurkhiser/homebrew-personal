require 'etc'

class Libkeyfinder < Formula
  desc     "Musical key detection for digital audio, GPL v3"
  homepage "https://github.com/mixxxdj/libkeyfinder"
  url      "https://github.com/mixxxdj/libkeyfinder/archive/refs/tags/v2.2.5.tar.gz"
  version  "v2.2.5"
  sha256   "516570e310f5bb5d87146fbefb129eb972dab3347987783554001e2cac26d9d6"

  depends_on "cmake" => :build
  depends_on "fftw"

  def install
    system "cmake -DCMAKE_INSTALL_PREFIX=#{prefix} -S . -B build"
    system "cmake --build build --parallel #{Etc.nprocessors}"
    system "cmake --install build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libkeyfinder`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
