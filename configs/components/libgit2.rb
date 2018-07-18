component "libgit2" do |pkg, settings, platform|
  pkg.version "0.25.1"
  pkg.md5sum "3b285ce94200f00c34962711f001b192"
  pkg.url "#{settings[:buildsources_url]}/#{pkg.get_name}-#{pkg.get_version}.tar.gz"
  pkg.dirname "#{pkg.get_name}-#{pkg.get_version}"

  if platform.name !~ /ubuntu-18/
    pkg.build_requires "pl-gcc"
    pkg.build_requires "pl-cmake"
    compiler_path = "/opt/pl-build-tools/bin/gcc"
    cmake_path = "/opt/pl-build-tools/bin/cmake"
  else
    pkg.build_requires "cmake"
    compiler_path = "/usr/bin/gcc"
    cmake_path = "/usr/bin/cmake"
  end

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
      CC=#{compiler_path} \
      #{cmake_path} .. \
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
      CC=#{compiler_path} \
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
