class Resyctl < Formula
  desc "Automation-friendly CLI for Resy with JSON output"
  homepage "https://github.com/evanpurkhiser/resyctl"
  url "https://github.com/evanpurkhiser/resyctl/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "85b2ba0337647831d9d34de51eb5de789c9e28ea57d5e8b43142bc544e4b0342"
  license "MIT"

  head "https://github.com/evanpurkhiser/resyctl.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "605514ac922623977a0b153713c53c6104617584aaaeafaaa0427e626c366a45"
  end

  depends_on arch: :arm64
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "auth", shell_output("#{bin}/resyctl --help")
  end
end
