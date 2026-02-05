class Hobby < Formula
  desc "Lua scripting tool for SVG vector graphics using Hobby-Knuth curves"
  homepage "https://github.com/boxesandglue/hobby"
  version "0.0.3"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-macos-arm64.tar.gz"
      sha256 "a354531dc1a95e68d508ebb26785c275fb17a54c4b2c4b4ce8c05a5a10d47606"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-macos-amd64.tar.gz"
      sha256 "1aa43bbcbc98504fd4d4a26b9c4dfee02674b57d33d5d1da87c9f5331d3e664a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-arm64.tar.gz"
      sha256 "36201b03c859a2b33a249c2c1422cfcbc7342efca9928c911a4e4b3d6b593626"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-amd64.tar.gz"
      sha256 "fde1871340046dd5f44748df1b3c2bb4073559937646de2dddaa3acf831cf906"
    end
  end

  def install
    bin.install "hobby"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hobby --version")
  end
end
