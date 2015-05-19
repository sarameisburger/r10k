component "rubygem-faraday" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "0.9.1"
  pkg.md5sum "046e7ddb8ae4dc1142a9114b5386d6bb"
  puts  "checking http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"
  end
end
