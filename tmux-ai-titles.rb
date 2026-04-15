class TmuxAiTitles < Formula
  desc "AI-powered title generation for tmux panes and windows"
  homepage "https://github.com/evanpurkhiser/tmux-ai-titles"
  url "https://github.com/evanpurkhiser/tmux-ai-titles/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "e6d5c40cf1743e48256c33ece3a76f62ca44595a7f5f592622d5c9794ad5eaff"
  license "MIT"

  head "https://github.com/evanpurkhiser/tmux-ai-titles.git", branch: "main"

  depends_on arch: :arm64
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "AI-powered", shell_output("#{bin}/tmux-ai-titles --help")
  end
end
