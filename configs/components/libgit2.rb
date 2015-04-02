component "libgit2" do |pkg, settings, platform|
  pkg.version "0.21.5"
  pkg.md5sum "6f1d64b2d50239f0c518cb45fbe3da4a"
  pkg.url "http://buildsources.delivery.puppetlabs.net/libgit2-0.21.5.tar.gz"

  pkg.build_requires "pl-gcc"
  pkg.build_requires "pl-cmake"
  
  if platform.is_rpm?
    pkg.build_requires "pkgconfig"
  else
    pkg.build_requires "pkg-config"
  end

  # cmake flags taken from https://github.com/libgit2/rugged/blob/v0.21.4/ext/rugged/extconf.rb#L50
  # CMAKE_SKIP_RPATH=ON appears to be required so that it doesn't strip '.' from the rpath
  pkg.configure do
    [
      "[ -d build ] || mkdir build",
      "cd build",
      "CFLAGS='#{settings[:cflags]}' \
      LDFLAGS='#{settings[:ldflags]}' \
      CMAKE_PREFIX_PATH='#{settings[:prefix]}' \
      PKG_CONFIG_PATH='#{settings[:pkg_config_path]}' \
      CC=/opt/pl-build-tools/bin/gcc \
      /opt/pl-build-tools/bin/cmake .. \
        -DCMAKE_INSTALL_PREFIX='#{settings[:prefix]}' \
        -DBUILD_CLAR=OFF \
        -DTHREADSAFE=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_PREFIX_PATH='#{settings[:prefix]}' \
        -DCMAKE_C_FLAGS=-fPIC \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -G \"Unix Makefiles\""
    ]
  end

  pkg.build do
    [
      "cd build && \
      CFLAGS='#{settings[:cflags]}' \
      LDFLAGS='#{settings[:ldflags]}' \
      CMAKE_PREFIX_PATH='#{settings[:prefix]}' \
      CC=/opt/pl-build-tools/bin/gcc \
      #{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1)"
    ]
  end

  pkg.install do
    [
      "cd build && \
      CFLAGS='#{settings[:cflags]}' \
      LDFLAGS='#{settings[:ldflags]}' \
      CMAKE_PREFIX_PATH='#{settings[:prefix]}' \
      #{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1) install"
    ]
  end
end
