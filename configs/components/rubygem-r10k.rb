component "rubygem-r10k" do |pkg, settings, platform|

  pkg.load_from_json('configs/components/rubygem-r10k.json')

  pkg.build_requires "pe-ruby"
  if platform.name =~ /ubuntu/
    pkg.build_requires "git-core"
  else
    pkg.build_requires "git"
  end

  pkg.install do
    [
      "gem build r10k.gemspec",
      "#{settings[:gem_inst]} r10k-*.gem"  ,
      %q{sed -i '/require./aENV["GEM_HOME"]="\/opt\/puppet\/lib\/r10k"\nGem.path.unshift("\/opt\/puppet\/lib\/r10k")\nGem.refresh'  /opt/puppet/bin/r10k},
    ]
  end
end
