component "r10k-yaml-example" do |pkg, settings, platform|
  pkg.version "0.0.1"
  pkg.md5sum "8495f2d37539683b49baa332202e5773"
  pkg.url "file://files/r10k.yaml.example.txt"
  pkg.install_file("./r10k.yaml.example.txt", "#{settings[:sysconfdir]}/r10k.yaml.example")
end
