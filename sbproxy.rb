class Sbproxy < Formula
  desc "AI Governance Gateway: one self-hostable runtime for AI traffic, APIs, MCP, and crawlers"
  homepage "https://sbproxy.dev"
  license "BUSL-1.1"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "99df8b718dfa61b6d1b9485415050a4e937db21e872bc87078abd1b9a5b6c7d3"
    else
      odie <<~EOS
        sbproxy v#{version} does not ship a darwin/amd64 (Intel Mac) bottle.
        The GitHub macos-13 runner pool has multi-hour queue times that
        stall every release. Use one of these instead:

          1. Run the linux/amd64 image under Docker:
               docker run --rm ghcr.io/soapbucket/sbproxy:#{version} --version
          2. Build from source:
               git clone https://github.com/soapbucket/sbproxy
               cd sbproxy && cargo build --release --bin sbproxy
      EOS
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_arm64.tar.gz"
      sha256 "7783ddbc7f00f9213aab19958921d6fb11cfab69b78545f7750df8cfa2d38bf7"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "3ce1bb347d102196f73a686bfdcc811b0fe8840b9c0b89ac0f7a68efec6e3c46"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
