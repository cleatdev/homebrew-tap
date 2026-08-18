class Cleat < Formula
  desc "Docker sandbox for AI coding agents"
  homepage "https://cleat.sh"
  url "https://github.com/cleatdev/cleat/releases/download/v1.4.0/cleat-1.4.0.tar.gz"
  sha256 "f217bf20cef4ae38d53bd179c76a9971d74932a7835148d4585b1d8c90d24497"
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
