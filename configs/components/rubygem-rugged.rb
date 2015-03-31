component "rubygem-rugged" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "0.21.4"
  pkg.md5sum "39cb6961fc65d248e752d8cbba54b452"
  puts  "checking http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "pe-ruby"
  pkg.build_requires "cmake"
  if platform.is_rpm?
    # red hat
    pkg.build_requires "pkgconfig"
  else
    # debian
    pkg.build_requires "pkg-config"
  end

  pkg.build_requires "libssh2"

  pkg.install do
    [
      "PKG_CONFIG_PATH='#{settings[:pkg_config_path]}' \
      CFLAGS='#{settings[:cflags]}' \
      LDFLAGS='#{settings[:ldflags]}' \
      #{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem -- --with-opt-dir=/opt/puppet"
    ]
  end
end
