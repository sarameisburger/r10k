peversion = IO.read('peversion').strip
platform "ubuntu-12.04-i386" do |plat|
  plat.servicedir "/etc/init.d"
  plat.defaultdir "/etc/default"
  plat.servicetype "sysv"
  plat.codename "precise"
  plat.apt_repo "http://enterprise.delivery.puppetlabs.net/#{peversion}/repos/#{plat.get_name}/#{plat.get_name}.repo"
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper "
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends --force-yes "
  plat.vcloud_name "ubuntu-1204-i386"
end
