class Hobby < Formula
  desc "Lua scripting tool for SVG vector graphics using Hobby-Knuth curves"
  homepage "https://github.com/boxesandglue/hobby"
  version "0.0.2"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-darwin-arm64.tar.gz"
      sha256 "a9d7292a910b322192763a97f1f4e03bce516d706f0b4ccfe9d8c21a1a0e6a42"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-darwin-amd64.tar.gz"
      sha256 "1c6aa3ee7dfdabbcdbe2abdb2ed9591b1cfddfba04ea9d400906b6bad45aeb4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-arm64.tar.gz"
      sha256 "e532ceefe0c32159d4487c3d0016546e7ff88ac55d9d0603b356902f24e4c4ed"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-amd64.tar.gz"
      sha256 "2e202b87a49dafcc5132c592f2fc09b9a01923cab3dd68ea7f5b151b479f1324"
    end
  end

  def install
    bin.install "hobby"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hobby --version")
  end
end
