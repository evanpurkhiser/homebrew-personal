class Resyctl < Formula
  desc "Automation-friendly CLI for Resy with JSON output"
  homepage "https://github.com/evanpurkhiser/resyctl"
  url "https://github.com/evanpurkhiser/resyctl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9e0f5428ffa7c68a91ef5f0b37e36878c7227a7b0340c3e5a44b4ae0dc5c88f8"
  license "MIT"

  head "https://github.com/evanpurkhiser/resyctl.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "464b5d440222078fc67b68e62d7846e6345ef752b5bd82e3978544e14221d1dc"
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
