component "rubygem-multi_json" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "1.11.0"
  pkg.md5sum "d9b22b25fd249e2b075cbac2ece6625b"
  puts  "checking http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "pe-ruby"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname} -v #{pkg.get_version}"
  end
end
