class Hobby < Formula
  desc "Lua scripting tool for SVG vector graphics using Hobby-Knuth curves"
  homepage "https://github.com/boxesandglue/hobby"
  version "0.0.4"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-macos-arm64.tar.gz"
      sha256 "13333d798936c043d48e9e9d6849e45eb674714268926c02c6c91c6b6c36438a"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-macos-amd64.tar.gz"
      sha256 "977d48747a0e1ce54f6955f960168d200556447155026841360e1f0295af6633"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-arm64.tar.gz"
      sha256 "1db9cec86ea7e2df1e177bc90de2b54c135e53f9f60c0d97d40562abfcaf5d6e"
    else
      url "https://github.com/boxesandglue/hobby/releases/download/v#{version}/hobby-linux-amd64.tar.gz"
      sha256 "23fdcff0864e66ab111f4500e7f15559e872391297ab00be7c0e3c75b6868a31"
    end
  end

  def install
    bin.install "hobby"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hobby --version")
  end
end
