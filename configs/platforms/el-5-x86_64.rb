peversion = IO.read('peversion').strip
platform "el-5-x86_64" do |plat|
  plat.servicedir "/etc/rc.d/init.d"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "sysv"
  plat.yum_repo "http://enterprise.delivery.puppetlabs.net/#{peversion}/repos/#{plat.get_name}/#{plat.get_name}.repo"
  plat.yum_repo "http://pl-build-tools.delivery.puppetlabs.net/yum/pl-build-tools-release-el-5.noarch.rpm"
  plat.provision_with "yum install -y autoconf automake createrepo rsync gcc make rpm-libs rpm-build yum-utils"
  plat.install_build_dependencies_with "yum install -y"
  plat.vcloud_name "centos-5-x86_64"
end
