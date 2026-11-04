class Xts < Formula
  desc "XML-based PDF typesetting system"
  homepage "https://github.com/speedata/xts"
  version "0.1.14"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-arm64.zip"
      sha256 "0bbd6b01b33a8ac337325cd6023261807e733720aa33767f299923f07a122a8b"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-amd64.zip"
      sha256 "0f9671cf12b4ec9737d915cd53a122cebd056bb41b849b89fb0eeee8a79fbab2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-arm64.tar.gz"
      sha256 "94375e242d74129b235c4d2618b78f3056eb23782d49b42bd8224f119c9267bd"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-amd64.tar.gz"
      sha256 "ab33cfe8f688d2642bb82317e540c52bf8e153310f94e6a1e7ce0f53574651a0"
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
