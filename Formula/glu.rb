class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/speedata/glu"
  version "0.0.4"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/glu/releases/download/v#{version}/glu-darwin-arm64.tar.gz"
      sha256 "16d105af0d50b2bc3e6a722630330175dd851501b4397b4dcb4897e6ae3802c7"
    else
      url "https://github.com/speedata/glu/releases/download/v#{version}/glu-darwin-amd64.tar.gz"
      sha256 "d7040e7d04c7d81267686dfcf6ada03b6b50269167f112f8361ca7d02d5f77cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "ca3e28e172f567c64d7d7041a4ec77f6b69a67d89803392b60e86a098ce66dcc"
    else
      url "https://github.com/speedata/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "36df4965ec7448af9b9910ef0bab86698735e7abb19a8f3ad29a29abef5c01ca"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
