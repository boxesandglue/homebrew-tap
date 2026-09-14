class Xts < Formula
  desc "XML-based PDF typesetting system"
  homepage "https://github.com/speedata/xts"
  version "0.0.29"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-arm64.zip"
      sha256 "783ed1c8863d294c6886eb8978f8286be24e653eba7cd7e7e26e316e856af0eb"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-macos-amd64.zip"
      sha256 "2fa95aac9f3936cb42e8763f5e87151e990aa3846f4ec382b55963bf6d35367c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-arm64.tar.gz"
      sha256 "de1649da36e09d9dc17872f4d7f64234b8ba39c7fe9b137451d4d26cf00872e5"
    else
      url "https://github.com/speedata/xts/releases/download/v#{version}/xts-linux-amd64.tar.gz"
      sha256 "ab28f119e4f79daf0234f156b8411a03cf77263eddaeeaa253afeee4a70ab8ae"
    end
  end

  def install
    bin.install "xts"
    (share/"xts/schema").install Dir["schema/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xts version")
  end
end
