peversion = IO.read('peversion').strip
platform "el-7-x86_64" do |plat|
  plat.servicedir "/usr/lib/systemd/system"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "systemd"
  plat.yum_repo "http://enterprise.delivery.puppetlabs.net/#{peversion}/repos/#{plat.get_name}/#{plat.get_name}.repo"
  plat.provision_with "yum install --assumeyes autoconf automake createrepo rsync gcc make rpmdevtools rpm-libs yum-utils rpm-sign"
  plat.install_build_dependencies_with "yum install --assumeyes"
  plat.vcloud_name "centos-7-x86_64"
end
