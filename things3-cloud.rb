class Things3Cloud < Formula
  desc "Command line access for Things 3 Cloud API"
  homepage "https://github.com/evanpurkhiser/things3-cloud"
  url "https://github.com/evanpurkhiser/things3-cloud/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "da0b8e0d7ddc4be327338aaf4b1a4c4c32eafdbc6c0f2993ec79ed9e2fbd3dd5"
  version "0.5.2"
  license "MIT"

  depends_on arch: :arm64
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    (bash_completion/"things3").write Utils.safe_popen_read(bin/"things3", "completions", "bash")
    (zsh_completion/"_things3").write Utils.safe_popen_read(bin/"things3", "completions", "zsh")
    (fish_completion/"things3.fish").write Utils.safe_popen_read(bin/"things3", "completions", "fish")
  end

  test do
    assert_match "--no-sync", shell_output("#{bin}/things3 --help")
  end
end
