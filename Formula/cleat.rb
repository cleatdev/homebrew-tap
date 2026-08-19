class Cleat < Formula
  desc "Docker sandbox for AI coding agents"
  homepage "https://cleat.sh"
  url "https://github.com/cleatdev/cleat/releases/download/v1.4.2/cleat-1.4.2.tar.gz"
  sha256 "3830c95b54a92566b7ab53b0d56fe2587c7b91481ef177e427b72476c06061dc"
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
