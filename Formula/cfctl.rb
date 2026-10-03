class Cfctl < Formula
  desc "The whole Cloudflare platform from your terminal (Workers, R2, DNS, every API operation)"
  homepage "https://github.com/dorkitude/cfctl"
  url "https://github.com/dorkitude/cfctl/archive/refs/tags/v0.2.710.tar.gz"
  sha256 "d0a325f9dd9e4f3f53496bb32ed8b0ef100085f029e844253eb3708dceaee5fd"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
    generate_completions_from_executable(bin/"cfctl", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cfctl --version")
    assert_match "GET /zones", shell_output("#{bin}/cfctl api describe zone list-zones")
  end
end
