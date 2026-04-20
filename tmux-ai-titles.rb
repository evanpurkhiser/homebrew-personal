class TmuxAiTitles < Formula
  desc "AI-powered title generation for tmux panes and windows"
  homepage "https://github.com/evanpurkhiser/tmux-ai-titles"
  url "https://github.com/evanpurkhiser/tmux-ai-titles/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "9293a9689ab5652e2b1b15c5f7e274dd041672784134bdb8da85190b90e22c5f"
  license "MIT"

  head "https://github.com/evanpurkhiser/tmux-ai-titles.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fca775a83ccf99bae50fd94e392f364a8b240ec27052c0c3734b00f8eceb5260"
  end

  depends_on arch: :arm64
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "AI-powered", shell_output("#{bin}/tmux-ai-titles --help")
  end
end
