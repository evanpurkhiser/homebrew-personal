class Things3Cloud < Formula
  desc "Command line access for Things 3 Cloud API"
  homepage "https://github.com/evanpurkhiser/things3-cloud"
  url "https://github.com/evanpurkhiser/things3-cloud/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "da0b8e0d7ddc4be327338aaf4b1a4c4c32eafdbc6c0f2993ec79ed9e2fbd3dd5"
  version "0.5.2"
  license "MIT"

  head "https://github.com/evanpurkhiser/things3-cloud.git", branch: "main"

  bottle do
    root_url "https://github.com/evanpurkhiser/homebrew-personal/releases/download/things3-cloud-0.5.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "81e2e5823f76ac542a3544b030788170258097beacc4463aaaf32f255ca1941e"
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
