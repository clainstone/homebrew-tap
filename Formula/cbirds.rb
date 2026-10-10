class Cbirds < Formula
  desc "Flock of birds in your terminal"
  homepage "https://github.com/clainstone/cbirds"
  url "https://github.com/clainstone/cbirds/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "b0ae60704047e336e442e5025e2458331ae06cea8a1016eb34221b0180014d8b"
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
