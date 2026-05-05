class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/boxesandglue/glu"
  version "0.0.11"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-arm64.tar.gz"
      sha256 "d5ff37a89d295582bf5112a8c1958c5877d098d97fb4ab7948c9e51c1adc35f7"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-amd64.tar.gz"
      sha256 "e00e5cc9ac4bfc851aa7ca65e37c7ba73f19836db0e6859a1f2914d634472dfb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "06a9ce088f195f35f10694f0273b1c69aaf1e832b209d807d68f4e5b7e3dc4f5"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "019d7ad2a1d6fb29f33a7fe5948cae240f14281b2ddb28e5922f48111ce9fa63"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
