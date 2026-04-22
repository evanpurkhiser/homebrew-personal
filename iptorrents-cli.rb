class IptorrentsCli < Formula
  desc "CLI for searching and downloading torrents from IPTorrents"
  homepage "https://github.com/evanpurkhiser/iptorrents-cli"
  url "https://github.com/evanpurkhiser/iptorrents-cli/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "276e47af834898639f52b6f882f9a1e22461427c81e4cdb65d5725951b2ca186"
  license "MIT"

  head "https://github.com/evanpurkhiser/iptorrents-cli.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8618ac0caa2687fcc6a594427d670cabd49b49e7a8970d3c6f84585ae4fcc025"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Search and download torrents from IPTorrents", shell_output("#{bin}/ipt --help")
  end
end
