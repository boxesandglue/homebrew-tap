class Xts < Formula
  desc "XML-based PDF typesetting system"
  homepage "https://github.com/speedata/xts"
  version "0.1.18"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-arm64.zip"
      sha256 "9de5d3a44b1930bcd5d68f9f9c3d824a03183e2b54a7764f7d364a8731150e54"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-amd64.zip"
      sha256 "3a89b7cb0d94aa986a0655635c5bc3e9fd805a72be4b69861ac8d3bf505c0fa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-arm64.tar.gz"
      sha256 "3aee8251cf231d38cb2b66dc6f12cba2b1c0595fe05dde7f23120e431d7c6544"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-amd64.tar.gz"
      sha256 "3bed4d495bc5e4cb6974c2cb8d54c44c554483aa06146ff6c8919ed1bdf213d7"
    end
  end

  def install
    bin.install "xts"
    (share/"xts/schema").install Dir["schema/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xts version")
  end
end
