project "pe-r10k" do |proj|


  # (RK-271) Conflict pe-r10k packages with client-tools packages
  # shipped prior to 16.4.0. Those packages have a gem conflict
  # with pe-r10k, where packages of that version and later do not.
  #
  # NOTE: the following translates to "conflict this project with
  # pe-client-tools packages with a version less than 16.4.0"
  proj.conflicts "pe-client-tools", "16.4.0"

  # Project level settings our components will care about
  proj.setting(:prefix, "/opt/puppetlabs/server/apps/r10k")
  proj.setting(:sysconfdir, "/etc/puppetlabs/r10k")
  proj.setting(:logdir, "/var/log/puppetlabs/r10k")
  proj.setting(:bindir, "/opt/puppetlabs/puppet/bin")
  proj.setting(:link_bindir, "/opt/puppetlabs/bin")
  proj.setting(:libdir, File.join(proj.prefix, "lib"))
  proj.setting(:includedir, File.join(proj.prefix, "include"))
  proj.setting(:datadir, File.join(proj.prefix, "share"))
  proj.setting(:mandir, "/opt/puppetlabs/server/share/man")
  proj.setting(:gem_inst, "/opt/puppetlabs/puppet/bin/gem install --no-rdoc --no-ri --bindir=/opt/puppetlabs/puppet/bin --local --force ")
  proj.setting(:pkg_config_path, "/opt/puppetlabs/puppet/lib/pkgconfig/:/opt/puppetlabs/server/apps/r10k/lib/pkgconfig/")
  proj.setting(:gem_path, "/opt/puppetlabs/puppet/lib/ruby/gems/2.4.0/gems/")

#  proj.setting(:ruby_vendordir, File.join(proj.libdir, "ruby", "vendor_ruby"))

  proj.description "R10k for Puppet Enterprise"
  proj.version_from_git
  proj.license "Puppet Labs Commercial"
  proj.vendor "Puppet Labs <info@puppetlabs.com>"
  proj.homepage "https://www.puppetlabs.com"
  proj.requires 'puppet-agent'
  proj.requires 'pe-client-tools'

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
  proj.component "rubygem-minitar"
  proj.component "rubygem-multipart-post"
  proj.component "rubygem-log4r"
  proj.component "rubygem-multi_json"
  proj.component "rubygem-semantic_puppet"
  proj.component "rubygem-ffi"
  proj.component "rubygem-ethon"
  proj.component "rubygem-typhoeus"
  proj.component "rubygem-puppet_forge"
  proj.component "rubygem-r10k"
  proj.component "r10k-yaml-example"

  proj.directory proj.prefix
  proj.directory proj.sysconfdir
  proj.directory proj.logdir
  proj.directory "/opt/puppetlabs/bin"
  proj.directory "/opt/puppetlabs/puppet/bin"
  proj.directory "/opt/puppetlabs/puppet/lib/ruby/gems"

end
