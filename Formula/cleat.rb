class Cleat < Formula
  desc "Docker sandbox for AI coding agents"
  homepage "https://cleat.sh"
  url "https://github.com/cleatdev/cleat/releases/download/v1.5.0/cleat-1.5.0.tar.gz"
  sha256 "fa1b8de33bd073cc6163b44079cb1887152f1ff5b332afd955cdfe1c205c41e0"
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
