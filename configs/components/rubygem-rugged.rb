component "rubygem-rugged" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "0.21.4"
  pkg.md5sum "39cb6961fc65d248e752d8cbba54b452"
  puts  "checking http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"
  pkg.build_requires "cmake"
  pkg.build_requires "pkgconfig"

  pkg.install do
    "PKG_CONFIG_PATH=#{settings[:pkg_config_path]} #{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem -- --use-system-libraries --with-opt-dir=/opt/puppetlabs/agent/  "
    #"#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem "
  end
end
