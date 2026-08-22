class TmuxAiTitles < Formula
  desc "AI-powered title generation for tmux panes and windows"
  homepage "https://github.com/evanpurkhiser/tmux-ai-titles"
  url "https://github.com/evanpurkhiser/tmux-ai-titles/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "b5a012343d6418d8ec5acbefa764a1448db39eddc82f520a50d6459f76ccef0e"
  license "MIT"

  head "https://github.com/evanpurkhiser/tmux-ai-titles.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "06229d9314aee046e7a42e9d2c68f35599a89b12b484f752d8c0c57dd3aa3bbd"
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
