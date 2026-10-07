class Xts < Formula
  desc "XML-based PDF typesetting system"
  homepage "https://github.com/speedata/xts"
  version "0.1.5"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-arm64.zip"
      sha256 "fc1b5dc0aef26f427622ce2b04ecf6ce55ba8375c790f53c21c991faded36ca8"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-amd64.zip"
      sha256 "08418a9dd4b2fc2ca7cc7eedc989a44dc42e08cd51351ae1431c4003f5bc8aef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-arm64.tar.gz"
      sha256 "34d5c2c12684fb0a4e3c8763a005f817b5f3916abc640647d347299bb2d5297f"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-amd64.tar.gz"
      sha256 "743436d903a8bd8e1ccc15bd32dcd8fe2fcdcd9a81b96014cb88aedba54c9e98"
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
