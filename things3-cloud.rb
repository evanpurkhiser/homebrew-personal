class Things3Cloud < Formula
  desc "Command line access for Things 3 Cloud API"
  homepage "https://github.com/evanpurkhiser/things3-cloud"
  url "https://github.com/evanpurkhiser/things3-cloud/archive/refs/tags/v0.8.3.tar.gz"
  sha256 "ef94124010285019f6f52b2a8b90ffb434d9e19f2e459a38157268d37e206fd2"
  license "MIT"

  head "https://github.com/evanpurkhiser/things3-cloud.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c46e863f64785f0bc73d660a733448957233a014d8e1799f4fb94ed2e669ed76"
  end

  depends_on arch: :arm64
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin / "things3", "completions")
  end

  test do
    assert_match "--no-sync", shell_output("#{bin}/things3 --help")
  end
end
