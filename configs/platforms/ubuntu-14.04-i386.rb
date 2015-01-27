platform "ubuntu-14.04-i386" do |plat|
  plat.servicedir "/etc/init.d"
  plat.defaultdir "/etc/default"
  plat.servicetype "sysv"
  plat.codename "trusty"

  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; wget http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-trusty.deb;dpkg -i pl-build-tools-release-trusty.deb;apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper "
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends "
  plat.vcloud_name "ubuntu-1404-i386"
end
