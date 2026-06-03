class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/boxesandglue/glu"
  version "0.0.21"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-arm64.tar.gz"
      sha256 "739a90ad47b636b1a825f7db970a7e3fd21e14304718b2cf3de46b6d50019fcc"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-amd64.tar.gz"
      sha256 "6264b143c27636909d6ddb8b6ac7be2e9d227d0e87c060688ec4899d0c7e6b2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "1a4fcc810cada66ff9953ca6b98c74bdbd3348530bff1d08f0a5c8816e6aa842"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "4a90eb0b53b163c00b9b737bb4214abc5bb7c77989f3b5b1663cdd54f751bf20"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
