component "rubygem-minitar" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "0.5.4"
  pkg.md5sum "f5bd734fb3eda7b979d1485ba48fc0ea"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"
  end
end
