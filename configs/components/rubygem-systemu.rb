component "rubygem-systemu" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "2.5.2"
  pkg.md5sum "7ac461f71ebf29b68f286fe34730c2f2"
  puts  "checking http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"
  end
end
