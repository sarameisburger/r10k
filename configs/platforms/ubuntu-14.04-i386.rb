tag = IO.read('puppet-agent-version').strip
platform "ubuntu-14.04-i386" do |plat|
  plat.servicedir "/etc/init.d"
  plat.defaultdir "/etc/default"
  plat.servicetype "sysv"
  plat.codename "trusty"
  plat.vcloud_name "ubuntu-1404-i386"
  plat.apt_repo "http://builds.puppetlabs.lan/puppet-agent/#{tag}/repo_configs/deb/pl-puppet-agent-#{tag}-#{plat.get_codename}.list"
  plat.apt_repo "http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-#{plat_get_codename}.deb"
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper "
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends --force-yes "
end
