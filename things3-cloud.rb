class Things3Cloud < Formula
  desc "Command line access for Things 3 Cloud API"
  homepage "https://github.com/evanpurkhiser/things3-cloud"
  url "https://github.com/evanpurkhiser/things3-cloud/releases/download/v0.5.0/things3-darwin-arm64"
  version "0.5.0"
  sha256 "4197db6773783bb7c20c31453236226bd6fe10e35f9fd43370c307ddfb2a3ebd"
  license "MIT"

  depends_on arch: :arm64

  def install
    bin.install "things3-darwin-arm64" => "things3"

    if quiet_system bin/"things3", "completions", "bash"
      (bash_completion/"things3").write Utils.safe_popen_read(bin/"things3", "completions", "bash")
      (zsh_completion/"_things3").write Utils.safe_popen_read(bin/"things3", "completions", "zsh")
      (fish_completion/"things3.fish").write Utils.safe_popen_read(bin/"things3", "completions", "fish")
    else
      opoo "Skipping shell completion install: installed binary does not support `things3 completions`"
    end
  end

  test do
    assert_match "--no-sync", shell_output("#{bin}/things3 --help")
  end
end
