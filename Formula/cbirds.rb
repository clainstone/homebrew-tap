class Cbirds < Formula
  desc "Flock of birds in your terminal"
  homepage "https://github.com/clainstone/cbirds"
  url "https://github.com/clainstone/cbirds/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "268b9a2d3f6288f5df8e07ffe956c7140f23a7da62ca0c9261c084df3d373b34"
  license "MIT"
  head "https://github.com/clainstone/cbirds.git", branch: "master"

  def install
    system "make", "install", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
    generate_completions_from_executable(bin/"cbirds", "--completion")
  end

  test do
    assert_match "cbirds #{version}", shell_output("#{bin}/cbirds --version")
    # A benchmark runs the whole flock with no terminal attached.
    assert_match "fps", shell_output("#{bin}/cbirds --bench 30")
  end
end
