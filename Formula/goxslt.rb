class Goxslt < Formula
  desc "XSLT 3.0 processor written in Go"
  homepage "https://github.com/speedata/goxslt"
  version "0.0.5"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-macos-arm64.tar.gz"
      sha256 "fba7919e8d0afe5996ce5242d00114cf074c6c119d9d042e2f2758d154d531cb"
    else
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-macos-amd64.tar.gz"
      sha256 "6bf61373a0d67dd965c55fec418c37bbf9d65dfeafa5e6f560d6ef97c9122c44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-linux-arm64.tar.gz"
      sha256 "19c6c7b16df902d82facc9cf8cbeedb011f8ec97c54cce94314a5c454f1c9fe3"
    else
      url "https://github.com/speedata/goxslt/releases/download/v#{version}/goxslt-linux-amd64.tar.gz"
      sha256 "d10faf8a1eda58977af20a29fee4b673916a43639ac301785dda8acbe2f489f9"
    end
  end

  def install
    bin.install "goxslt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goxslt --version")
  end
end
