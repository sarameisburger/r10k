project "code-management" do |proj|
  # Project level settings our components will care about
  proj.setting(:prefix, "/opt/puppetlabs/server/apps/code-management")
  proj.setting(:sysconfdir, "/etc/puppetlabs/server/apps/code-management")
  proj.setting(:logdir, "/var/log/puppetlabs/server/apps/code-management")
  proj.setting(:piddir, "/var/run/puppetlabs/server/apps/code-management")
  proj.setting(:bindir, File.join(proj.prefix, "bin"))
  proj.setting(:libdir, File.join(proj.prefix, "lib"))
  proj.setting(:includedir, File.join(proj.prefix, "include"))
  proj.setting(:datadir, File.join(proj.prefix, "share"))
  proj.setting(:mandir, File.join(proj.datadir, "man"))
  proj.setting(:gem_inst, "GEM_HOME=/opt/puppetlabs/server/apps/code-management /opt/puppetlabs/agent/bin/gem install --no-rdoc --no-ri --bindir=/opt/puppetlabs/server/bin --local --force  ")
  proj.setting(:pkg_config_path, "/opt/puppetlabs/server/apps/code-management/lib/pkgconfig/:/opt/puppetlabs/agent/lib/pkgconfig/")
#  proj.setting(:ruby_vendordir, File.join(proj.libdir, "ruby", "vendor_ruby"))

  proj.description "Code Management bits"
  proj.version_from_git
  proj.license "Puppet Labs Commercial"
  proj.vendor "Puppet Labs <info@puppetlabs.com>"
  proj.homepage "https://www.puppetlabs.com"
#  proj.require 'puppet-agent'



  # Platform specific
  proj.setting(:cflags, "-I#{proj.includedir}")
  proj.setting(:ldflags, "-L#{proj.libdir} -Wl,-rpath=#{proj.libdir}")

  proj.component "libssh2"
  proj.component "rubygem-rugged"
  proj.component "rubygem-colored"
  proj.component "rubygem-cri"
  proj.component "rubygem-faraday"
  proj.component "rubygem-faraday_middleware-multi_json"
  proj.component "rubygem-json_pure"
  proj.component "rubygem-log4r"
  proj.component "rubygem-multi_json"
  proj.component "rubygem-r10k"
  proj.component "rubygem-systemu"


  proj.directory proj.prefix
  proj.directory proj.sysconfdir
  proj.directory proj.logdir
  proj.directory proj.piddir
  proj.directory '/opt/puppetlabs/server/bin'

end
