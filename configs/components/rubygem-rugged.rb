component "rubygem-rugged" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "0.28.1"
  pkg.md5sum "19eedd62c721f26176b1fc8a2fc71784"
  pkg.url "#{settings[:buildsources_url]}/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"
  pkg.build_requires "cmake"
  if platform.is_rpm?
    # red hat
    pkg.build_requires "pkgconfig"
  else
    # debian
    pkg.build_requires "pkg-config"
  end

  if platform.name =~ /ubuntu-18|el-8/
    compiler_path = "/usr/bin/gcc"
  else
    compiler_path = "/opt/pl-build-tools/bin/gcc"
  end

  pkg.install do
    [
      "PKG_CONFIG_PATH='#{settings[:pkg_config_path]}' \
      CFLAGS='#{settings[:cflags]}' \
      LDFLAGS='#{settings[:ldflags]}' \
      CC=#{compiler_path} \
      #{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem -- --with-opt-dir=#{settings[:prefix]} --use-system-libraries"
    ]
  end
end
