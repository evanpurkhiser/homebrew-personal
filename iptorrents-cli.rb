class IptorrentsCli < Formula
  desc "CLI for searching and downloading torrents from IPTorrents"
  homepage "https://github.com/evanpurkhiser/iptorrents-cli"
  url "https://github.com/evanpurkhiser/iptorrents-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e42035d6be3092f4c8a3f82f14ffaaa0cc46a3647b6d01688bee7ef74a92fb3f"
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
