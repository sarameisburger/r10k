platform "ubuntu-14.04-amd64" do |plat|
  plat.servicedir "/etc/init.d"
  plat.defaultdir "/etc/default"
  plat.servicetype "sysv"
  plat.codename "trusty"

  plat.provision_with "pushd /etc/apt/sources.list.d; wget http://builds.puppetlabs.lan/puppet-agent/0.2.0/repo_configs/deb/pl-puppet-agent-0.2.0-trusty.list ; popd  ; export DEBIAN_FRONTEND=noninteractive; wget http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-trusty.deb;dpkg -i pl-build-tools-release-trusty.deb;apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper "
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --force-yes --no-install-recommends "
  plat.vcloud_name "ubuntu-1404-x86_64"
end
