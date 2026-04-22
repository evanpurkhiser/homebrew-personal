class TmuxAiTitles < Formula
  desc "AI-powered title generation for tmux panes and windows"
  homepage "https://github.com/evanpurkhiser/tmux-ai-titles"
  url "https://github.com/evanpurkhiser/tmux-ai-titles/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "000b6ffc535650d8e96900b228fcf14afa335e0add318d3a20772cf9208feac8"
  license "MIT"

  head "https://github.com/evanpurkhiser/tmux-ai-titles.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c80423b97a2bf8df6f0388fe3305a46a4516295b014929ed5314ad203c8662cf"
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
