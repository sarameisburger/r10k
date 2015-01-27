component "rubygem-faraday" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "0.8.9"
  pkg.md5sum "0357d6707191defde069baddce70e534"
  puts  "checking http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"
  end
end
