component "rubygem-rugged" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "0.21.4"
  pkg.md5sum "39cb6961fc65d248e752d8cbba54b452"
  puts  "checking http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"
  pkg.build_requires "cmake"
  if platform.is_rpm?
    # red hat
    pkg.build_requires "pkgconfig"
  else
    # debian
    pkg.build_requires "pkg-config"
  end

  pkg.install do
    #[ "PKG_CONFIG_PATH=#{settings[:pkg_config_path]} #{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem -- --with-opt-dir=/opt/puppetlabs/agent/  ", "rm -rf /opt/puppetlabs/server/apps/code-management/gems/rugged-0.21.4/vendor/libgit2/build/" , "rm -rf /opt/puppetlabs/server/apps/code-management/gems/rugged-0.21.4/vendor/libgit2/src /opt/puppetlabs/server/apps/code-management/gems/rugged-0.21.4/vendor/libgit2/include /opt/puppetlabs/server/apps/code-management/gems/rugged-0.21.4/vendor/libgit2/deps /opt/puppetlabs/server/apps/code-management/gems/rugged-0.21.4/vendor/libgit2/cmake" ]
    [ "PKG_CONFIG_PATH=#{settings[:pkg_config_path]} #{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem -- --with-opt-dir=/opt/puppetlabs/agent/  " ]
  end
end
