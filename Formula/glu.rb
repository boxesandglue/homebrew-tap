class Glu < Formula
  desc "Lua-based PDF creation tool using boxes and glue"
  homepage "https://github.com/boxesandglue/glu"
  version "0.0.22"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-arm64.tar.gz"
      sha256 "b607ed246b7a75901823764cc0babbb8aa560618908ae2ae070c26ff78595bd6"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-macos-amd64.tar.gz"
      sha256 "3a7c0d525c27a285fed613b0a1078e7d1284cf95cddadb987345ea5054c46b67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-arm64.tar.gz"
      sha256 "1e14a49237066c00a8accd8e228ebbf145df799f2333e77c7bcc3e6b0e22561c"
    else
      url "https://github.com/boxesandglue/glu/releases/download/v#{version}/glu-linux-amd64.tar.gz"
      sha256 "6f08229f22e6a8e33cd2b53a5af7f8d967d35129d44d5c5ef9fb56631ea4d002"
    end
  end

  def install
    bin.install "glu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glu --version")
  end
end
