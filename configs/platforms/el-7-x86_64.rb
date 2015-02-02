tag = IO.read('puppet-agent-version').strip
platform "el-7-x86_64" do |plat|
  plat.servicedir "/usr/lib/systemd/system"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "systemd"
  plat.yum_repo "http://builds.puppetlabs.lan/puppet-agent/#{tag}/repo_configs/rpm/pl-puppet-agent-#{tag}-#{plat.get_name}.repo"
  plat.yum_repo "http://pl-build-tools.delivery.puppetlabs.net/yum/pl-build-tools-release-el-7.noarch.rpm"
  plat.provision_with "yum install --assumeyes autoconf automake createrepo rsync gcc make rpmdevtools rpm-libs yum-utils rpm-sign"
  plat.install_build_dependencies_with "yum install --assumeyes"
  plat.vcloud_name "centos-7-x86_64"
end
