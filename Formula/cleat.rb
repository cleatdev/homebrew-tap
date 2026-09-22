class Cleat < Formula
  desc "Docker sandbox for AI coding agents"
  homepage "https://cleat.sh"
  url "https://github.com/cleatdev/cleat/releases/download/v1.5.1/cleat-1.5.1.tar.gz"
  sha256 "3dd342defab1b97fd0d51c72e13e626f9857c5e0f5e677400f3485146b0f2e35"
  license "MIT"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cleat"
  end

  def caveats
    <<~EOS
      Cleat needs Docker at runtime. If Docker is missing, cleat offers to
      install it on first run.
    EOS
  end

  test do
    plain = shell_output("#{bin}/cleat --version").gsub(/\e\[[0-9;]*m/, "")
    assert_match "cleat v#{version}", plain
  end
end
