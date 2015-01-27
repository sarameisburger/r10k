platform "el-7-x86_64" do |plat|
  plat.servicedir "/usr/lib/systemd/system"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "systemd"

  plat.provision_with "yum install --assumeyes autoconf automake createrepo rsync gcc make rpmdevtools rpm-libs yum-utils rpm-sign;echo '[pl-build-tools]\nname=pl-build-tools\ngpgcheck=0\nbaseurl=http://pl-build-tools.delivery.puppetlabs.net/yum/el/6/$basearch' > /etc/yum.repos.d/pl-build-tools.repo ; echo '[pl-puppet-agent-0.2.0]\nname=PL Repo for puppet-agent at commit 0.2.0\nbaseurl=http://builds.puppetlabs.lan/puppet-agent/0.2.0/repos/el/7/products/x86_64/\nenabled=1\ngpgcheck=0' > /etc/yum.repos.d/pl-puppet-agent.repo"
  plat.install_build_dependencies_with "yum install --assumeyes"
  plat.vcloud_name "centos-7-x86_64"
end
