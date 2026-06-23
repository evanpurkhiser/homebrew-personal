class Things3Cloud < Formula
  desc "Command line access for Things 3 Cloud API"
  homepage "https://github.com/evanpurkhiser/things3-cloud"
  url "https://github.com/evanpurkhiser/things3-cloud/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "947227cbdd87133720b650e5cbe376c32ec3afce340f5d5f1c6dff8e3f2945fa"
  license "MIT"

  head "https://github.com/evanpurkhiser/things3-cloud.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "035e7e75623eed3f9502c1378c2a860832e0296d99382ed42bb45e16e2d5565f"
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
