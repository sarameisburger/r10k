component "rubygem-r10k" do |pkg, settings, platform|
  gemname = pkg.get_name.gsub('rubygem-', '')
  pkg.version "1.4.1"
  pkg.md5sum "6b7ae57f59c593fa42833b9cf0798bc3"
  puts  "checking http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"
  pkg.url "http://buildsources.delivery.puppetlabs.net/#{gemname}-#{pkg.get_version}.gem"

  pkg.build_requires "pe-ruby"

  pkg.install do
    [ "#{settings[:gem_inst]} #{gemname}-#{pkg.get_version}.gem"  ,
      %q{sed -i '/require./aENV["GEM_HOME"]="\/opt\/puppet\/lib\/r10k"\nGem.path.unshift("\/opt\/puppet\/lib\/r10k")\nGem.refresh'  /opt/puppet/bin/r10k},
    ]
  end

  pkg.install_file("#{settings[:libdir]}/r10k/gems/r10k-#{pkg.get_version}/r10k.yaml.example", "#{settings[:sysconfdir]}/r10k.yaml.example")
end
