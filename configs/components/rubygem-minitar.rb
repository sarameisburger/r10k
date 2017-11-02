component "rubygem-minitar" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "0.6.1"
  pkg.md5sum "ce4ee63a94e80fb4e3e66b54b995beaa"
  pkg.url "#{settings[:buildsources_url]}/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.install do
    "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"
  end
end
