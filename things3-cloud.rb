class Things3Cloud < Formula
  desc "Command line access for Things 3 Cloud API"
  homepage "https://github.com/evanpurkhiser/things3-cloud"
  url "https://github.com/evanpurkhiser/things3-cloud/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "65facfefc321ca667cb575ca8354c6aab49dbaf4fd92bfa115630d1d4074b96a"
  license "MIT"

  head "https://github.com/evanpurkhiser/things3-cloud.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "53328a35698cbead6c50e728155d444aabdd926fb06945e1be4429932fd6fb95"
  end

  depends_on arch: :arm64
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"things3", "completions")
  end

  test do
    assert_match "--no-sync", shell_output("#{bin}/things3 --help")
  end
end
