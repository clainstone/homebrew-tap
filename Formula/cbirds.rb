class Cbirds < Formula
  desc "Flock of birds in your terminal"
  homepage "https://github.com/clainstone/cbirds"
  url "https://github.com/clainstone/cbirds/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "2daa4d0f17c74c6fef208bfd849c8f6920cec58fa3408e00d28fddf2a8fdb073"
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
