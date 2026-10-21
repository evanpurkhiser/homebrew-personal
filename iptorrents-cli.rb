class IptorrentsCli < Formula
  desc "CLI for searching and downloading torrents from IPTorrents"
  homepage "https://github.com/evanpurkhiser/iptorrents-cli"
  url "https://github.com/evanpurkhiser/iptorrents-cli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "f6d28df6a0a92db4ada86f4a71afc92453cb7f56bad566d4cf20237b3573d6fe"
  license "MIT"

  head "https://github.com/evanpurkhiser/iptorrents-cli.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/evanpurkhiser/personal"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4c83b3c65944e2300eca64ce0e9062b66b855a64eea404bf06d871ae5466c0d1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Search and download torrents from IPTorrents", shell_output("#{bin}/ipt --help")
  end
end
