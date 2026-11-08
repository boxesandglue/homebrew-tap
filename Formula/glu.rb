class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/boxesandglue/glu"
  version "0.0.56"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-arm64.tar.gz"
      sha256 "35b36ab3db9de5f5ea12b4983613f613fdf4bd5ef36861bb37906fa8aec41233"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-amd64.tar.gz"
      sha256 "b25ae5ce63c5215742655990f13fb83a7e28e69360d58ba240b9443e84f6a2eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "b315b8b7cfed483d9f8763ae15f7693bd12895bcc4feada75c9b33cbbabbad49"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "60084147346d4458900ab471db5515eb5f14b332a5bb1922c5991ab215f338ab"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
