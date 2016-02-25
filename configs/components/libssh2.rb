component "libssh2" do |pkg, settings, platform|
  pkg.version "1.7.0"
  pkg.md5sum "b01662a210e94cccf2f76094db7dac5c"
  pkg.url "http://buildsources.delivery.puppetlabs.net/libssh2-#{pkg.get_version}.tar.gz"

  pkg.build_requires 'puppet-agent'

  ## As documented in http://trac.libssh2.org/ticket/273, at the moment
  ## the configure will ignore --with-ssl-prefix. The workaround is 
  ## passing the CFLAGS and LDFLAGS as evnvironment to both the
  ## configure and the build
  pkg.configure do
    [
      "CFLAGS='#{settings[:cflags]}' \
      LDFLAGS='#{settings[:ldflags]}' \
      ./configure \
        --prefix=#{settings[:prefix]} \
        --with-openssl \
        --with-libssl-prefix=/opt/puppetlabs/puppet \
        --without-libgcrypt \
        --enable-shared"
    ]
  end

  pkg.build do
    [
      "CFLAGS='#{settings[:cflags]}' \
      LDFLAGS='#{settings[:ldflags]}' \
      #{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1)"
    ]
  end

  pkg.install do
    ["#{platform[:make]} -j$(shell expr $(shell #{platform[:num_cores]}) + 1) install"]
  end
end
