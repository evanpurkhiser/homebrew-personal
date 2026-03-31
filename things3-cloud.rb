class Things3Cloud < Formula
  desc "Command line access for Things 3 Cloud API"
  homepage "https://github.com/evanpurkhiser/things3-cloud"
  url "https://github.com/evanpurkhiser/things3-cloud/releases/download/v0.3.0/things3-darwin-arm64"
  version "0.3.0"
  sha256 "263e2a896e953128c99e4cc42fd3eedf66233f4fba187a5228b913777ba66b33"
  license "MIT"

  depends_on arch: :arm64

  def install
    bin.install "things3-darwin-arm64" => "things3"
  end

  test do
    assert_match "--no-sync", shell_output("#{bin}/things3 --help")
  end
end
