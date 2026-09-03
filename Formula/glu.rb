class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/boxesandglue/glu"
  version "0.0.35"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-arm64.tar.gz"
      sha256 "64d223b7a8a4bda84a26431fd1709554f3c20177c7a07417ad66a696e2c07cb2"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-amd64.tar.gz"
      sha256 "c7806ebf3e642b3d58d9b4a1dc1a00c193aead6e4167f18f7a9d8f78f3835b0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "9e7b45bbf5a6b053f4662c5d4110724752f02f19f07d8d6426b1b4456c2a4879"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "79de51e4edeb34ebbd2ac5f208735ce3deef716c54e4fdad01fafb266873dd4c"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
