class Xts < Formula
  desc "XML-based PDF typesetting system"
  homepage "https://github.com/speedata/xts"
  version "0.1.17"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-arm64.zip"
      sha256 "eb35f2bb65f42b1d4aee51f7d24d1e7cbc66e563ed82c88c20524652c4796dac"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-amd64.zip"
      sha256 "61b07cbf40617b34bfd21c1d02869fdb05346888661abba958afeacc15ab1fd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-arm64.tar.gz"
      sha256 "edd00d6dd6e9eb44c7d9283738952adf906d68f0576c2c7017e9ba7960fd68ee"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-amd64.tar.gz"
      sha256 "c2e98aadf3e6e089ac4d6fbe80313c4db0e02c611b525e737923dd6d8ead1ee0"
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
