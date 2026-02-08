class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/boxesandglue/glu"
  version "0.0.6"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-arm64.tar.gz"
      sha256 "8eb89e84294c6a19b535f6d33a450543755b7e6b9f2acb38f327016b8e58b2a1"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-amd64.tar.gz"
      sha256 "0433f21d420ed9d00c0536a61ad3ae7e5aaff002bc68cb69fac704aab256db78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "f62aa825a74c4b43a75ecdb77ddbcebd0a172c8b7744e88549ba169756e80b13"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "67db94a4d94f0d475cc4ce69099a8bacd4c21c1a5c9398b06d016f53e0ab84ce"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
