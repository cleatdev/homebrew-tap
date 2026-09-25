class Cleat < Formula
  desc "Docker sandbox for AI coding agents"
  homepage "https://cleat.sh"
  url "https://github.com/cleatdev/cleat/releases/download/v1.5.4/cleat-1.5.4.tar.gz"
  sha256 "273c3dc3c4e31822c96904f8ae85f333f60c7cdf52349c3cfae3a4cedb1a1691"
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
