peversion = IO.read('peversion').strip
platform "sles-11-x86_64" do |plat|
  plat.servicedir "/etc/init.d"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "sysv"
  plat.zypper_repo "http://enterprise.delivery.puppetlabs.net/#{peversion}/repos/#{plat.get_name}/#{plat.get_name}.repo"
  # Don't take this one out. SLES 11 is special
  plat.zypper_repo "http://osmirror.delivery.puppetlabs.net/sles-11-deps-x86_64/sles-11-deps-x86_64.repo"
  plat.provision_with "zypper -n --no-gpg-checks install -y aaa_base autoconf automake rsync gcc make"
  plat.install_build_dependencies_with "zypper -n --no-gpg-checks install -y"
  plat.vcloud_name "sles-11-x86_64"
end
