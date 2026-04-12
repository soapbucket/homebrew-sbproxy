class Sbproxy < Formula
  desc "High-performance reverse proxy and AI gateway"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "815fbcd31be43022a99374adee8b470d1e63ef9eba77314dace74bfb127266b8"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_amd64.tar.gz"
      sha256 "13289c2db9459fe2618d851c1ff7ef895ac09b4128ce26e8937188f4855e99d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_arm64.tar.gz"
      sha256 "d3628f573b663869ec30b2009c1e3f01c9b85512d4850eb5514a5f4d5f3786af"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "568647b1acff944f907a341d2f17ae202dbf556f8c6e6f10110bae5df66ff905"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
