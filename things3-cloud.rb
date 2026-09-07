class Things3Cloud < Formula
  desc "Command line access for Things 3 Cloud API"
  homepage "https://github.com/evanpurkhiser/things3-cloud"
  url "https://github.com/evanpurkhiser/things3-cloud/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "a8746472d594500ed366a233fbea2cc74645ea619ad539be22ef12c44c2dc255"
  license "MIT"

  head "https://github.com/evanpurkhiser/things3-cloud.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1647777aeaed6dbf4f2ae9b9d28545cf82ffec5c43ea62cd057263888f8d17a7"
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
