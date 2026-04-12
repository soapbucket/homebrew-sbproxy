class Sbproxy < Formula
  desc "High-performance reverse proxy and AI gateway"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "ea07a3f2bfe091a0eef05c5c78e80128ac05844ccf97b7c46ea1d879c26ad672"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_amd64.tar.gz"
      sha256 "3e85baea2a52c08c3ce79707f0fe50701a004e6498e21fcda55cd7411e75fb4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_arm64.tar.gz"
      sha256 "8798fc7c0c8adf25532e9ebfc9f30ea38df69d8ccfe30ccdfa378d32076ad9d7"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "b958576bcae9f3497ec385883a3eca991dd7266d36cfd5ba52a583ae69959724"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
