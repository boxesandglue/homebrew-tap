class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/boxesandglue/glu"
  version "0.0.29"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-arm64.tar.gz"
      sha256 "a4fe3d83a35c1d9524316cb792dcf9edc71b03e8fc478d36f0e49acfc3c18d10"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-amd64.tar.gz"
      sha256 "ffe76a0f58f610302eb032a0ba6cb61a0476bba6ecf22ab7b9bce99068c29bc0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "ad4705418476aa6c28126a140c628d2f193e82767f8c0b6f86d7f46e5f4d0cac"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "dfd8711ea3732b39c26d75a7b2198b58ac8e029a90863edc890f243978823f1b"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
