class Sbproxy < Formula
  desc "The AI gateway built like a real proxy"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "0.1.2-final"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "b4ae9c1be03924f1224b42cc5d2aaafa735daf1fdd6ce37307de37f21957aa5c"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_amd64.tar.gz"
      sha256 "e5962de71919f5382f41c06540429b7048818b5d936b1115802714f28210ee80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_arm64.tar.gz"
      sha256 "ab42eb3f6691655e14942b4fcbbac33bbba0b5e9f4854b73381c888017b0b447"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "32ec9b3d2ab71495ec6877e88b10f764e932abf66755e7d85420489dc0713cf5"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
