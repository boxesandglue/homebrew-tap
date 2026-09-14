class Hobby < Formula
  desc "Lua scripting tool for SVG vector graphics using Hobby-Knuth curves"
  homepage "https://github.com/boxesandglue/hobby"
  version "0.0.7"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-macos-arm64.tar.gz"
      sha256 "cd3502bb56a80d766ae2f1a09486d8d624722083ed5c7c79523745c9c18863dd"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-macos-amd64.tar.gz"
      sha256 "c4cc0146b22fec3a75df704e30077105dc83c19e3bf934d7ef45c25c04a2e278"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-arm64.tar.gz"
      sha256 "5e51542a3fad97086ecea6b9ae241ee9c7f3385ed218bb70d6a8dc4086173bb6"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-amd64.tar.gz"
      sha256 "eacb6c94d5fc439939adf24ba31a87c2d70ef6322628f0b8b0cfe167ac29beaa"
    end
  end

  def install
    bin.install "hobby"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hobby --version")
  end
end
