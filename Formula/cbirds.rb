class Cbirds < Formula
  desc "Flock of birds in your terminal"
  homepage "https://github.com/clainstone/cbirds"
  url "https://github.com/clainstone/cbirds/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "4e3e4db6fec6abc71cd6e8d9404cfe917531f41792c01edc4d9e3ad14fb459af"
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
