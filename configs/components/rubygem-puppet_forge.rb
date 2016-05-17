component "rubygem-puppet_forge" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "2.2.0"
  pkg.md5sum "b4ff4094328617e46ee939641083ba04"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"
  end
end
