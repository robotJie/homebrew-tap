class MdnsReflectorGo < Formula
    desc "Simple mDNS reflector written in golang"
    homepage "https://github.com/robotJie/mdns_reflector_go"
    url "https://github.com/robotJie/mdns_reflector_go/archive/refs/tags/v0.0.5.tar.gz"
    version "0.0.5"
    sha256 "48b6f47e15e767b5fa4ee76b519a451a7aeee4e3f9f445dc3d8df24895d91d42"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", *std_go_args(ldflags: "-s -w"), "main.go"
    end
  
    test do
      assert_match "-ifaces", shell_output("#{bin}/mdns-reflector-go --help 2>&1")
    end
  end
  