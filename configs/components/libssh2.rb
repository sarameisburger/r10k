component "libssh" do |pkg, settings, platform|
  pkg.version "1.4.3"
  pkg.md5sum "071004c60c5d6f90354ad1b701013a0b"
  pkg.url "http://buildsources.delivery.puppetlabs.net/libssh2-1.4.3.tar.gz"

  pkg.build_requires "pl-gcc"
  pkg.build_requires "pl-cmake"
  pkg.build_requires "automake"
  pkg.build_requires "autoconf"
  pkg.build_requires "make"
  pkg.build_requires "libtool"
  pkg.build_requires "puppet-agent"

  pkg.configure do
    ["PKG_CONFIG_PATH=#{settings[:pkg_config_path]} ./configure --prefix=#{settings[:prefix]}"]
  end

  pkg.build do
    ["#{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1)"]
  end

  pkg.install do
    ["#{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1) install", "rm -rf #{settings[:prefix]}/share/" ]
  end
end
