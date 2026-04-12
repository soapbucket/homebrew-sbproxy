class Sbproxy < Formula
  desc "High-performance reverse proxy and AI gateway"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "640e32dcab44b0d2c5c95879930dd1de1fb7f8f34cb7c1ab7895aaf11fe6c9b2"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_amd64.tar.gz"
      sha256 "1cc674904b697eb610de2a907ebbb86e64fd3f612322cc9fd85172aa19f52975"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_arm64.tar.gz"
      sha256 "61b9d6c2fdc0009c097f996e5087b9d65d5bdccc38e084c645c077c65d953b61"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "6c0a30471d872c6266147eb64f6caf98016754d7a5b4ae77b8ee213526b6d242"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
