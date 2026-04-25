class Resyctl < Formula
  desc "Automation-friendly CLI for Resy with JSON output"
  homepage "https://github.com/evanpurkhiser/resyctl"
  url "https://github.com/evanpurkhiser/resyctl/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "81442a1416d02a9cf082e2d67d364b9c640a8137e44796b419e1a2481169783f"
  license "MIT"

  head "https://github.com/evanpurkhiser/resyctl.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ac3b149b7d93443b830d83a50636a1bbc526c4de861715e333d656eeeae7afe2"
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
