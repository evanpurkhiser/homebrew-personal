class IptorrentsCli < Formula
  desc "CLI for searching and downloading torrents from IPTorrents"
  homepage "https://github.com/evanpurkhiser/iptorrents-cli"
  url "https://github.com/evanpurkhiser/iptorrents-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e42035d6be3092f4c8a3f82f14ffaaa0cc46a3647b6d01688bee7ef74a92fb3f"
  license "MIT"

  head "https://github.com/evanpurkhiser/iptorrents-cli.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8f627e27349d4223f0e6e80c6232be24f5dc9d1a0fedaa5746f6d7049565675f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Search and download torrents from IPTorrents", shell_output("#{bin}/ipt --help")
  end
end
