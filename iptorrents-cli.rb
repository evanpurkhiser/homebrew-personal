class IptorrentsCli < Formula
  desc "CLI for searching and downloading torrents from IPTorrents"
  homepage "https://github.com/evanpurkhiser/iptorrents-cli"
  url "https://github.com/evanpurkhiser/iptorrents-cli/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  sha256 "496dfc51eee8904ab989e5e667f92bea830c134d249181a1db7c7fba3470b364"
  license "MIT"

  head "https://github.com/evanpurkhiser/iptorrents-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Search and download torrents from IPTorrents", shell_output("#{bin}/ipt --help")
  end
end
