component "rubygem-puppet_forge" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "2.2.8"
  pkg.md5sum "229d627fcc9d9060172018c6f9905cd4"
  pkg.url "#{settings[:buildsources_url]}/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"
  end
end
