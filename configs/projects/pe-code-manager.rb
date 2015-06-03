project "pe-code-manager" do |proj|
  # Project level settings our components will care about
  proj.setting(:prefix, "/opt/puppetlabs/server/apps/code-manager")
  proj.setting(:sysconfdir, "/etc/puppetlabs/code-manager")
  proj.setting(:logdir, "/var/log/puppetlabs/code-manager")
  proj.setting(:bindir, File.join(proj.prefix, "bin"))
  proj.setting(:libdir, File.join(proj.prefix, "lib"))
  proj.setting(:includedir, File.join(proj.prefix, "include"))
  proj.setting(:datadir, File.join(proj.prefix, "share"))
  proj.setting(:mandir, "/opt/puppetlabs/server/share/man")
  proj.setting(:gem_inst, "/opt/puppetlabs/puppet/bin/gem install --no-rdoc --no-ri --bindir=/opt/puppetlabs/puppet/bin --local --force ")
  proj.setting(:pkg_config_path, "/opt/puppetlabs/puppet/lib/pkgconfig/")
#  proj.setting(:ruby_vendordir, File.join(proj.libdir, "ruby", "vendor_ruby"))

  proj.description "R10k for Puppet Enterprise"
  proj.version_from_git
  proj.license "Puppet Labs Commercial"
  proj.vendor "Puppet Labs <info@puppetlabs.com>"
  proj.homepage "https://www.puppetlabs.com"
  proj.requires 'puppet-agent'

  # Platform specific
  proj.setting(:cflags, "-I#{proj.includedir} -I/opt/puppetlabs/puppet/include")
  proj.setting(:ldflags, "-L#{proj.libdir} -L/opt/puppetlabs/puppet/lib -Wl,-rpath=#{proj.libdir} -Wl,-rpath=/opt/puppetlabs/puppet/lib")

  proj.component "libssh2"
  proj.component "libgit2"
  proj.component "rubygem-rugged"
  proj.component "rubygem-colored"
  proj.component "rubygem-cri"
  proj.component "rubygem-faraday"
  proj.component "rubygem-faraday_middleware"
  proj.component "rubygem-faraday_middleware-multi_json"
  proj.component "rubygem-multipart-post"
  proj.component "rubygem-json_pure"
  proj.component "rubygem-log4r"
  proj.component "rubygem-multi_json"
  proj.component "rubygem-semantic_puppet"
  proj.component "rubygem-r10k"

  proj.directory proj.prefix
  proj.directory proj.sysconfdir
  proj.directory proj.logdir
  proj.directory "/opt/puppetlabs/puppet/bin"
  proj.directory "/opt/puppetlabs/puppet/lib/ruby/gems"

end
