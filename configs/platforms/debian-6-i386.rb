peversion = IO.read('peversion').strip
platform "debian-6-i386" do |plat|
  plat.servicedir "/etc/init.d"
  plat.defaultdir "/etc/default"
  plat.servicetype "sysv"
  plat.codename "squeeze"
  plat.apt_repo "http://enterprise.delivery.puppetlabs.net/#{peversion}/repos/#{plat.get_name}/#{plat.get_name}.repo"
  plat.apt_repo "http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-#{plat_get_codename}.deb"
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper "
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends --force-yes "
  plat.vcloud_name "debian-6-i386"
end
