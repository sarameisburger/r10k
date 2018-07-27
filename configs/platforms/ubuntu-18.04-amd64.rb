peversion = IO.read('peversion').strip
platform "ubuntu-18.04-amd64" do |plat|
  plat.servicedir "/lib/systemd/system"
  plat.defaultdir "/etc/default"
  plat.servicetype "systemd"
  plat.codename "bionic"
  plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-#{plat.get_codename}.deb"
  plat.provision_with "curl https://enterprise.delivery.puppetlabs.net/pluto.pub.gpg | apt-key add - "
  plat.provision_with "curl -o '/etc/apt/sources.list.d/enterprise.list' 'http://enterprise.delivery.puppetlabs.net/#{peversion}/repos/ubuntu-18.04-amd64/ubuntu-18.04-amd64.repo'"
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper rsync fakeroot"
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends "
  plat.vmpooler_template "ubuntu-1804-x86_64"
end
