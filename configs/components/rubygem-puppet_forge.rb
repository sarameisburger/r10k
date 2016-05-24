component "rubygem-puppet_forge" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "2.2.1"
  pkg.md5sum "1c8a7d9879171c87d1cd61a4382741c3"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"
  end
end
