class Things3Cloud < Formula
  desc "Command line access for Things 3 Cloud API"
  homepage "https://github.com/evanpurkhiser/things3-cloud"
  url "https://github.com/evanpurkhiser/things3-cloud/releases/download/v0.5.2/things3-darwin-arm64"
  version "0.5.2"
  sha256 "e11b7c0c69d5c1ac00ee9fcb5b53eb85085c5dc3f6d80f8e9bafc95138ca684e"
  license "MIT"

  depends_on arch: :arm64

  def install
    bin.install "things3-darwin-arm64" => "things3"

    (bash_completion/"things3").write Utils.safe_popen_read(bin/"things3", "completions", "bash")
    (zsh_completion/"_things3").write Utils.safe_popen_read(bin/"things3", "completions", "zsh")
    (fish_completion/"things3.fish").write Utils.safe_popen_read(bin/"things3", "completions", "fish")
  end

  test do
    assert_match "--no-sync", shell_output("#{bin}/things3 --help")
  end
end
