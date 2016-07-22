component "rubygem-locale" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "2.1.2"
  pkg.md5sum "def1e89d1d3126a0c684d3b7b20d88d4"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}-2.gem"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}-2.gem"
  end
end
