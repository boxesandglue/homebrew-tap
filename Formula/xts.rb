class Xts < Formula
  desc "XML-based PDF typesetting system"
  homepage "https://github.com/speedata/xts"
  version "0.0.23"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-arm64.zip"
      sha256 "c76d27cfc603abd1ccb99635daeee9ea869f80e2db6d10f635795fbd2ef2c49f"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-amd64.zip"
      sha256 "890a7fd0cc92479bc2db056f9f2768f3229beecaf55f43beb60fbe63f40cebb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-arm64.tar.gz"
      sha256 "0b3cbf8c9f9d18e9e036fbca31789e1ad5e1f7c37422af112a04024787d4806f"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-amd64.tar.gz"
      sha256 "7bba667fa2c8b53d54e3bb1af6c5b13db6882f9d8c0fc06969cb75d90f96f5c8"
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
