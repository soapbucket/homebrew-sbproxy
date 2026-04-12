class Sbproxy < Formula
  desc "High-performance reverse proxy and AI gateway"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "9985fd87c9b9ab642a5a1f13394b10b9586abe3ef0cb73fc75c7e4cfa8e3894f"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_amd64.tar.gz"
      sha256 "abf15e4fedd6be51c1046edd67ee491ff1597dc9428080463b1ab7a5398fb9a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_arm64.tar.gz"
      sha256 "cf079b0e06ff6c8a2c76435b7a6e7c9aeefebb27c851ec3f13efa09908b34c97"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "868a462502154620b0c4826094d75eafb0e60be64d58d6280666ea87e6c2f655"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
