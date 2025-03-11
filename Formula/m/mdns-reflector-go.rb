class MdnsReflectorGo < Formula
    desc "Simple mDNS reflector written in golang"
    homepage "https://github.com/robotJie/mdns_reflector_go"
    url "https://github.com/robotJie/mdns_reflector_go/archive/refs/tags/v0.0.7.tar.gz"
    sha256 "bc713869b11809b5fa2ac68b6516d79d4e51cd78e731cc633b67c7e681889087"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", *std_go_args(ldflags: "-s -w"), "main.go"
    end

    service do
        run [opt_bin/"mdns-reflector-go"]
        keep_alive true
        log_path var/"log/mdns-reflector-go.log"
        error_log_path var/"log/mdns-reflector-go.log"
    end
  
    test do
      assert_match "-ifaces", shell_output("#{bin}/mdns-reflector-go --help 2>&1")
    end
  end
  