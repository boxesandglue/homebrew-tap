class Goxslt < Formula
  desc "XSLT 3.0 processor written in Go"
  homepage "https://github.com/speedata/goxslt"
  version "0.0.4"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-macos-arm64.tar.gz"
      sha256 "44aab84611ad31048d82ef7a17fd00cc29cf7cc436a10283cc20a8f1ccfdc6bd"
    else
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-macos-amd64.tar.gz"
      sha256 "5c23da1e5b902039e2f40f72036abd5ac6ea694469c2eeffb0775ced9f2f4232"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-linux-arm64.tar.gz"
      sha256 "8da7fc6a46e5d7653447a9fad8f43af82b37f52d7bd899a2b75c7d9ceabd07d3"
    else
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-linux-amd64.tar.gz"
      sha256 "6f0c61d4ff72be3e700421be864a8c60f23208516dfaaac072754968e5c1f35c"
    end
  end

  def install
    bin.install "goxslt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goxslt --version")
  end
end
