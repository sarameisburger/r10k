component "r10k-yaml-example" do |pkg, settings, platform|
  pkg.version "0.0.1"
  pkg.md5sum "c3c0da294db7ba00480f911c0b91dc0f"
  pkg.url "file://files/r10k.yaml.example.txt"
  pkg.install_file("./r10k.yaml.example.txt", "#{settings[:sysconfdir]}/r10k.yaml.example")
end
