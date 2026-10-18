class Xts < Formula
  desc "XML-based PDF typesetting system"
  homepage "https://github.com/speedata/xts"
  version "0.1.12"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-arm64.zip"
      sha256 "88c6d87328b30fee8ab4a5cbaa5fcfa90e0ec89e7356b14ad8fb8293e3cddc3e"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-amd64.zip"
      sha256 "b20bb5f909c757dc8c3d0fd54a732c14898a8fe6b0430729f03e78fb792d7f2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-arm64.tar.gz"
      sha256 "c254f9b71e46b03fcc69092ce751944859ba851dbdd5348b0ff3cdce4f26ac3a"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-amd64.tar.gz"
      sha256 "8301d8b3d803f1da3fe2733d59b54fb09f6c6f0e1dfd3c2c115952e0c1605701"
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
