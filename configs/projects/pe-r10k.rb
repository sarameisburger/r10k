project "pe-r10k" do |proj|
  # Project level settings our components will care about
  proj.setting(:prefix, "/opt/puppet")
  proj.setting(:sysconfdir, "/etc/puppetlabs/r10k")
  proj.setting(:logdir, "/var/log/pe-r10k")
  proj.setting(:bindir, File.join(proj.prefix, "bin"))
  proj.setting(:libdir, File.join(proj.prefix, "lib"))
  proj.setting(:includedir, File.join(proj.prefix, "include"))
  proj.setting(:datadir, File.join(proj.prefix, "share"))
  proj.setting(:mandir, File.join(proj.datadir, "man"))
  proj.setting(:gem_inst, "GEM_HOME=/opt/puppet/lib/r10k /opt/puppet/bin/gem install --no-rdoc --no-ri --bindir=/opt/puppet/bin --local --force  ")
  proj.setting(:pkg_config_path, "/opt/puppet/lib/pkgconfig/")
#  proj.setting(:ruby_vendordir, File.join(proj.libdir, "ruby", "vendor_ruby"))

  proj.description "R10k for Puppet Enterprise"
  proj.version_from_git
  proj.license "Puppet Labs Commercial"
  proj.vendor "Puppet Labs <info@puppetlabs.com>"
  proj.homepage "https://www.puppetlabs.com"
  proj.requires 'pe-ruby'

  # Platform specific
  proj.setting(:cflags, "-I#{proj.includedir}")
  proj.setting(:ldflags, "-L#{proj.libdir} -Wl,-rpath=#{proj.libdir}")

  # It looks like ssh capabilities are statically linked into rugged
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
  proj.component "rubygem-r10k"

  proj.directory proj.prefix
  proj.directory proj.sysconfdir
  proj.directory proj.logdir

end
