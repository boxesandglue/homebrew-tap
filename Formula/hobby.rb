class Hobby < Formula
  desc "Lua scripting tool for SVG vector graphics using Hobby-Knuth curves"
  homepage "https://github.com/boxesandglue/hobby"
  version "0.0.1"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-darwin-arm64.tar.gz"
      sha256 "0824c0a66e502f8389a41ffdf36898dcb05ce0878d819f2b07aab11014b4e5be"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-darwin-amd64.tar.gz"
      sha256 "fd15b5e0c6abeea555d19f72806d07c74050c24903b96cd542f944fec0ea0c02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-arm64.tar.gz"
      sha256 "d09d0dad112d4dc2fadbd296803eac5ef427bcffaa6dee0e9f85844d4220f113"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-amd64.tar.gz"
      sha256 "6ab5af8069aa156dffa1468515f9ea29cff1e3990eab5b8f8b691882074c0420"
    end
  end

  def install
    bin.install "hobby"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hobby --version")
  end
end
