class Goxslt < Formula
  desc "XSLT 3.0 processor written in Go"
  homepage "https://github.com/speedata/goxslt"
  version "0.0.6"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-macos-arm64.tar.gz"
      sha256 "1bd8cc94bd5b4818532013c8647731cc147c572861bef523727741c993594d0b"
    else
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-macos-amd64.tar.gz"
      sha256 "94aac5396e0b15863d181f092cef98c5bfc937697fa7954d638a3ffcf34f2f7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-linux-arm64.tar.gz"
      sha256 "f30535e7ff4bc127056367ae151ac7cca81d9c57551f782d0e24eadb4eafd171"
    else
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-linux-amd64.tar.gz"
      sha256 "ab52118deb24263c79f57f44f0fe9882e7c9c2763ede60680c0cb16b7cabba6a"
    end
  end

  def install
    bin.install "goxslt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goxslt --version")
  end
end
