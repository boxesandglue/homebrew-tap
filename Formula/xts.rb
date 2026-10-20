class Xts < Formula
  desc "XML-based PDF typesetting system"
  homepage "https://github.com/speedata/xts"
  version "0.1.13"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-arm64.zip"
      sha256 "cdb04cd2df7cb21da1e425ba0ef191ef9b439f64380b10fb5a308707d358b0ba"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-amd64.zip"
      sha256 "ae9a63a253c3a3fdcef69fe6210885156fc9e6a3fe9a45ff343e35b2e231b5b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-arm64.tar.gz"
      sha256 "38553e7452678334788e7b57c146d2d8bbeb59e50bcfb23916bb314ff86d0a49"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-amd64.tar.gz"
      sha256 "ab6094850a3a3a903c1cf3592a06afc2a91c0c68f7815ee4f282485c70c5e384"
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
