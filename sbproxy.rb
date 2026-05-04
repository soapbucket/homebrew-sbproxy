class Sbproxy < Formula
  desc "The AI gateway built like a real proxy"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "0.1.2-go-final"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "c29f4bd61701bc889011231d2c4b3bccfdc8933d1dedd96e7aaa74fede63d39d"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_amd64.tar.gz"
      sha256 "88453ebbcb607c1f78fbe167f4930f6b207a2e52a32f7896079c8007517247b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_arm64.tar.gz"
      sha256 "4dade7c9e173ddfe335bb329075de37626b7898309c299bd2ea9ec5594b9cf0d"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "9db12cd62592d1a2bd1daf43d75228b878d4b82121a99663ae232fec768b3f54"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
