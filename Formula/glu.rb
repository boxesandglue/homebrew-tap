class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/boxesandglue/glu"
  version "0.0.15"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-arm64.tar.gz"
      sha256 "bb1b986fafe9fd774c09188706e6ebe65f56f5d906cd628a2ea2c574e8928ca3"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-amd64.tar.gz"
      sha256 "9dd26db34f4147fd0dff8fa4551ab97ee5c4c6cea5ca581788851b443f83c217"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "947d51eb2c94499fb443ee6c13ff9502fa9fc4667cca1b1e5cca4ab13e50ec5f"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "e9dbf9b57ca4751df5a66ffe2445f67240ae855a6c609a51f9763e57ec308a35"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
