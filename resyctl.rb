class Resyctl < Formula
  desc "Automation-friendly CLI for Resy with JSON output"
  homepage "https://github.com/evanpurkhiser/resyctl"
  url "https://github.com/evanpurkhiser/resyctl/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "a63d202d4912fb019f6d11ecdddf41537abbbcb936332931a851ccc20b341ec8"
  license "MIT"

  head "https://github.com/evanpurkhiser/resyctl.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ae9dfee3687e0058ec257fbee43535492695af7becc272b4cb64d2a2a513b9e9"
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
