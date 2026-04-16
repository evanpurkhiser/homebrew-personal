class TmuxAiTitles < Formula
  desc "AI-powered title generation for tmux panes and windows"
  homepage "https://github.com/evanpurkhiser/tmux-ai-titles"
  url "https://github.com/evanpurkhiser/tmux-ai-titles/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e992b1ca552081926a5da8e0751768960795c6298bfa9df839462681c95f7c7e"
  license "MIT"

  head "https://github.com/evanpurkhiser/tmux-ai-titles.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ad67b8fae68c2298d689547175df09bdf256dba47ae6a07cf9f5c56ed931e316"
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
