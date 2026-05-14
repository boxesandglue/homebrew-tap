class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/boxesandglue/glu"
  version "0.0.17"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-arm64.tar.gz"
      sha256 "1f94727e3da06068fd0d9851b3d6a0bca33d19d26b4824175dba2cade79ba808"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-amd64.tar.gz"
      sha256 "220c7e99491e85dcdaaec0ac7bdec73aaa7509466e77d50e23ec68b8dd918a21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "e98c8bd44a866866abaf13dbd5e1c004b69554f681e6f76c09a2c3b311dabb0f"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "c9993ee8fde53abbb77cde403a554e099455b9a36bfd3466229a555ebccda53c"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
