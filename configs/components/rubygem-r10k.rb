component "rubygem-r10k" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "1.4.1"
  pkg.md5sum "6b7ae57f59c593fa42833b9cf0798bc3"
  puts  "checking http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "puppet-agent"

  pkg.install do
    [ "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"  , 
      %q{sed -i '/require./aGem.path.unshift("\/opt\/puppetlabs\/server\/apps\/code-management")'  /opt/puppetlabs/server/bin/r10k}
    ]
  end
end
