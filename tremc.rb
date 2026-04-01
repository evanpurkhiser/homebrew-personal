class Tremc < Formula
  desc "Curses interface for transmission"
  homepage "https://github.com/tremc/tremc"
  url "https://github.com/tremc/tremc/archive/0.9.4.tar.gz"
  sha256 "f8cd45f2bfc1fa67dc8816659d81beacb9fd7b7a4a4b8402604a71c29836bd6f"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "29fb7e0093f1778afe2f78569c559f1001c390a366952817add8abc03ce0cd60"
  end

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
