class Resyctl < Formula
  desc "Automation-friendly CLI for Resy with JSON output"
  homepage "https://github.com/evanpurkhiser/resyctl"
  url "https://github.com/evanpurkhiser/resyctl/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "90a69d47a7111843c55152bc2083bb7656eebe2205e428b4cb169d299e0b8685"
  license "MIT"

  head "https://github.com/evanpurkhiser/resyctl.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "992e1428b75660473e7395cf399a51f71e9c346ccce1aff93548470f9733a3cb"
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
