component "libgit2" do |pkg, settings, platform|
  pkg.version "0.21.5"
  pkg.md5sum "6f1d64b2d50239f0c518cb45fbe3da4a"
  pkg.url "http://buildsources.delivery.puppetlabs.net/libgit2-0.21.5.tar.gz"

  pkg.build_requires "pl-gcc"
  pkg.build_requires "pl-cmake"
  pkg.build_requires "cmake"
  pkg.build_requires "puppet-agent"
  pkg.build_requires "libssh2"

# Here
  pkg.configure do
    ["PKG_CONFIG_PATH=#{settings[:pkg_config_path]} /opt/pl-build-tools/bin/cmake -DCMAKE_TOOLCHAIN_FILE=/opt/pl-build-tools/pl-build-toolchain.cmake -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_INSTALL_PREFIX=#{settings[:prefix]} ."]
  end
  #pkg.configure do
  #  ["./configure --prefix=#{settings[:prefix]}"]
  #end

  pkg.build do
    ["#{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1)"]
  end

  pkg.install do
    ["#{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1) install"]
  end
end
