# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libkeyfinder < Formula
  desc     "Musical key detection for digital audio, GPL v3"
  homepage "https://github.com/ibsh/libKeyFinder"
  url      "https://github.com/ibsh/libKeyFinder/archive/v2.2.1.tar.gz"
  version  "v2.2.1"
  sha256   "f168247012da2467af846d5a1301ca3eff23eb48938fb9b2dbbfa8dd0e5ccf10"

  depends_on "qt5" => :build
  depends_on "fftw"

  patch :DATA

  def install
    system "qmake"
    system "INSTALL_ROOT=#{prefix} make install"
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

__END__
diff --git a/LibKeyFinder.pro b/LibKeyFinder.pro
index 149016c..fc8778d 100644
--- a/LibKeyFinder.pro
+++ b/LibKeyFinder.pro
@@ -81,9 +81,9 @@ macx{
   CONFIG += x86_64
 
   # installation of headers and the shared object
-  target.path = /usr/local/lib
-  headers.path = /usr/local/include/$$TARGET
-  QMAKE_LFLAGS_SONAME = -Wl,-install_name,/usr/local/lib/
+  target.path = /lib
+  headers.path = /include/$$TARGET
+  QMAKE_LFLAGS_SONAME = -Wl,-install_name,/lib/
 }
 
 unix:!macx{
