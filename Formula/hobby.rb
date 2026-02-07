class Hobby < Formula
  desc "Lua scripting tool for SVG vector graphics using Hobby-Knuth curves"
  homepage "https://github.com/boxesandglue/hobby"
  version "0.0.5"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-macos-arm64.tar.gz"
      sha256 "463a47dd7aad2aecc4e0b2f309b6f352dc4a1654fdd274b66f6727c70579eab4"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-macos-amd64.tar.gz"
      sha256 "b5592813b70505a29f02dc5a6a817b66b071b7db1da5e10e2346c3602e1e1a19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-arm64.tar.gz"
      sha256 "f73689667c067b713354a4bc5196d4ec10813107a0d3cb90941d98d9da263c83"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-amd64.tar.gz"
      sha256 "90291ec12297229a7223c0203b06c9f78aea2d2b2c933bad8459927c1f88818d"
    end
  end

  def install
    bin.install "hobby"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hobby --version")
  end
end
